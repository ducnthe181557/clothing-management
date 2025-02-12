package org.example.clothingmanagement.repository;

import com.mysql.cj.jdbc.MysqlDataSource;
import org.example.clothingmanagement.entity.Employee;

import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EmployeeDAO {

    private static final String URL = "jdbc:mysql://localhost:3306/warehousemanagement";
    private static final String USER = "root";
    private static final String PASSWORD = "";
    private static final DataSource dataSource = createDataSource();

    private static DataSource createDataSource() {
        MysqlDataSource ds = new MysqlDataSource();
        ds.setURL("jdbc:mysql://localhost:3306/warehousemanagement");
        ds.setUser("root");
        ds.setPassword("");
        return ds;
    }

    public boolean createEmployee(Employee employee) {
        String sql = "INSERT INTO Employee (EmployeeName, Email, Phone, Address, Gender, DateOfBirth, Status, WarehouseID, RoleID , Image) " +
                "VALUES (?, ?, ?, ?, ?, ?, 'Active', ?, ?, ?)";

        try (Connection conn = DBContext.getConnection();
             PreparedStatement pt = conn.prepareStatement(sql)) {
            pt.setString(1, employee.getEmployeeName());
            pt.setString(2, employee.getEmail());
            pt.setString(3, employee.getPhone());
            pt.setString(4, employee.getAddress());
            pt.setString(5, employee.getGender());
            pt.setDate(6, Date.valueOf(employee.getDateOfBirth()));
            pt.setInt(7, employee.getWarehouseID());
            pt.setInt(8, employee.getRoleId());
            pt.setString(9, employee.getImage());
            int rowsAffected = pt.executeUpdate();
            return rowsAffected > 0; // Return true if insertion was successful
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean isEmployeeExisted(String employeeId ,String email, String phone) {
        boolean exists = false;
        String sql = "SELECT * FROM Employee WHERE (Email = ? OR Phone = ?) AND employeeId != ? AND status = 'Active'";
        try (Connection conn = DBContext.getConnection();
        PreparedStatement pt = conn.prepareStatement(sql)) {
            pt.setString(1, email);
            pt.setString(2, phone);
            pt.setString(3, employeeId);
            ResultSet rs = pt.executeQuery();
            if(rs.next()) {
                exists = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return exists;
    }

    public boolean isEmployeeExistedWhenAdd(String email, String phone) {
        boolean exists = false;
        String sql = "SELECT * FROM Employee WHERE (Email = ? OR Phone = ?)  AND status = 'Active'";
        try (Connection conn = DBContext.getConnection();
             PreparedStatement pt = conn.prepareStatement(sql)) {
            pt.setString(1, email);
            pt.setString(2, phone);
            ResultSet rs = pt.executeQuery();
            if(rs.next()) {
                exists = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return exists;
    }



    public boolean updatePassword(int accountID, String newPassword) {
        String sql = "UPDATE Account SET Password = ? WHERE AccountID = ? AND status = 'Active'";
        try (Connection conn = DBContext.getConnection();
             PreparedStatement pt = conn.prepareStatement(sql)) {
            pt.setString(1, newPassword);
            pt.setInt(2, accountID);
            return pt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Update employee information
    public static boolean updateEmployee(Employee employee) {
        String sql = "UPDATE employee SET EmployeeName = ?, Email = ?, Phone = ?, Address = ?, Gender = ?, DateOfBirth = ?, Status= 'Active' , WarehouseID = ?, RoleID=? ,Image = ? WHERE EmployeeID = ?";

        try (Connection conn = DBContext.getConnection();
             PreparedStatement pt = conn.prepareStatement(sql)) {
            pt.setString(1, employee.getEmployeeName());
            pt.setString(2, employee.getEmail());
            pt.setString(3, employee.getPhone());
            pt.setString(4, employee.getAddress());
            pt.setString(5, employee.getGender());
            pt.setDate(6, Date.valueOf(employee.getDateOfBirth()));
            pt.setInt(7, employee.getWarehouseID());
            pt.setInt(8, employee.getRoleId());
            pt.setString(9, employee.getImage());
            pt.setString(10, employee.getEmployeeID());
            return pt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public List<Employee> getAllEmployee() {
        List<Employee> employees = new ArrayList<>();
        String sql = "SELECT e.*, r.RoleName, w.WarehouseName " +
                "FROM Employee e " +
                "JOIN Role r ON e.RoleID = r.RoleID " +
                "JOIN Warehouse w ON e.WarehouseID = w.WarehouseID " +
                "WHERE e.Status = 'Active'";
        try (Connection conn = DBContext.getConnection();
             PreparedStatement pt = conn.prepareStatement(sql);
             ResultSet rs = pt.executeQuery()) {
            while (rs.next()) {
                Employee employee = new Employee();
                employee.setEmployeeID(rs.getString("EmployeeID"));
                employee.setEmployeeName(rs.getString("EmployeeName"));
                employee.setEmail(rs.getString("Email"));
                employee.setPhone(rs.getString("Phone"));
                employee.setAddress(rs.getString("Address"));
                employee.setGender(rs.getString("Gender"));
                employee.setDateOfBirth(rs.getDate("DateOfBirth").toLocalDate());
                employee.setStatus(rs.getString("Status"));
                employee.setRoleId(rs.getInt("RoleID"));
                employee.setRoleName(rs.getString("RoleName")); // Lấy tên vai trò
                employee.setWarehouseID(rs.getInt("WarehouseID"));
                employee.setWarehouseName(rs.getString("WarehouseName")); // Lấy tên kho
                employee.setImage(rs.getString("Image"));
                employees.add(employee);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return employees;
    }

    public Employee getEmployeeByID(String employeeID) {
        Employee employee = null;
        String sql = "SELECT e.*, r.RoleName, w.WarehouseName " +
                "FROM Employee e " +
                "JOIN Role r ON e.RoleID = r.RoleID " +
                "JOIN Warehouse w ON e.WarehouseID = w.WarehouseID " +
                "WHERE e.EmployeeID = ? AND e.Status = 'Active'";
        try (Connection conn = DBContext.getConnection();
             PreparedStatement pt = conn.prepareStatement(sql)){
            pt.setString(1, employeeID);
            try (ResultSet rs = pt.executeQuery()) {
                while (rs.next()) {
                    employee = new Employee();
                    employee.setEmployeeID(rs.getString("EmployeeID"));
                    employee.setEmployeeName(rs.getString("EmployeeName"));
                    employee.setEmail(rs.getString("Email"));
                    employee.setPhone(rs.getString("Phone"));
                    employee.setAddress(rs.getString("Address"));
                    employee.setGender(rs.getString("Gender"));
                    employee.setDateOfBirth(rs.getDate("DateOfBirth").toLocalDate());
                    employee.setStatus(rs.getString("Status"));
                    employee.setRoleId(rs.getInt("RoleID"));
                    employee.setRoleName(rs.getString("RoleName"));
                    employee.setWarehouseID(rs.getInt("WarehouseID"));
                    employee.setWarehouseName(rs.getString("WarehouseName"));
                    employee.setImage(rs.getString("Image"));
                }
            }catch (SQLException e){
                e.printStackTrace();
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return employee;
    }

    public boolean deleteEmployee(String employeeID) {
        String sql = "UPDATE Employee SET Status = 'Inactive' WHERE EmployeeID = ?";
        try (Connection conn = DBContext.getConnection();
             PreparedStatement pt = conn.prepareStatement(sql)) {
            pt.setString(1, employeeID);
            return pt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public String getEmployeeId(){
        String sql ="SELECT EmployeeID FROM Employee WHERE status = 'Active'";
        try (Connection conn = DBContext.getConnection();
        PreparedStatement pt = conn.prepareStatement(sql)) {
            ResultSet rs = pt.executeQuery();
            if(rs.next()) {
                return rs.getString("EmployeeID");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return null;
    }

    public List<String> getEmployeeIDsWithoutAccount() {
        List<String> employeeIds = new ArrayList<>();
        String sql = "SELECT e.EmployeeID FROM Employee e LEFT JOIN Account a ON e.EmployeeID = a.EmployeeID WHERE a.EmployeeID IS NULL AND e.Status = 'Active'";

        try (Connection conn = DBContext.getConnection();
             PreparedStatement pt = conn.prepareStatement(sql)) {

            try (ResultSet rs = pt.executeQuery()) {
                while (rs.next()) {
                    // Lấy EmployeeID và thêm vào danh sách
                    employeeIds.add(rs.getString("EmployeeID"));
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return employeeIds;
    }


    public static int getAccountIdByEmployeeId(int employeeID) {
        String sql = "SELECT AccountID FROM Employee WHERE EmployeeID = ?";
        try (Connection conn = dataSource.getConnection();
             PreparedStatement pt = conn.prepareStatement(sql)) {

            pt.setInt(1, employeeID);

            try (ResultSet resultSet = pt.executeQuery()) {
                if (resultSet.next()) {
                    return resultSet.getInt("AccountID");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1; // Return -1 if no account is found or an error occurs
    }

    public static String getEmployeeNameByEmployeeId(int employeeID) {
        String sql = "SELECT EmployeeName FROM Employee WHERE EmployeeID = ?";
        try (Connection conn = dataSource.getConnection(); // Sử dụng DataSource để kết nối
             PreparedStatement pt = conn.prepareStatement(sql)) {

            // Thiết lập giá trị cho tham số trong SQL
            pt.setInt(1, employeeID);

            // Thực thi truy vấn và xử lý kết quả
            try (ResultSet resultSet = pt.executeQuery()) {
                if (resultSet.next()) {
                    return resultSet.getString("EmployeeName"); // Lấy giá trị EmployeeName từ kết quả
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Log lỗi nếu có vấn đề xảy ra với truy vấn SQL
        }
        return null; // Trả về null nếu không tìm thấy hoặc có lỗi
    }

    public static void main(String[] args) {
        EmployeeDAO employeeDAO = new EmployeeDAO();
        List<Employee> list = employeeDAO.getAllEmployee();
        for (Employee e : list) {
            System.out.println(e);
        }
    }

}
