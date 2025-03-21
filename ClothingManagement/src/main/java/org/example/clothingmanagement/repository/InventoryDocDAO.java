package org.example.clothingmanagement.repository;

import org.example.clothingmanagement.entity.*;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import static org.example.clothingmanagement.repository.DBContext.getConnection;

public class InventoryDocDAO {

    public List<InventoryDoc> getAllInventoryDocs() {
        List<InventoryDoc> inventoryDocs = new ArrayList<>();
        String sql = "SELECT InventoryDocID, CreatedBy, CreatedDate, BinID, Status FROM inventorydoc";

        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                InventoryDoc inventoryDoc = new InventoryDoc();
                inventoryDoc.setInventoryDocId(rs.getString("InventoryDocID"));
                inventoryDoc.setCreatedBy(rs.getString("CreatedBy"));
                inventoryDoc.setCreatedDate(rs.getDate("CreatedDate"));
                inventoryDoc.setBinId(rs.getString("BinID"));
                inventoryDoc.setStatus(rs.getString("Status"));
                inventoryDocs.add(inventoryDoc);
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Log lỗi hoặc xử lý tùy ý
        }

        return inventoryDocs;
    }

    public static List<BinDetail> getBinDetailByBinID(String binID) {
        List<BinDetail> list = new ArrayList<>();
        String sql = "SELECT bd.BinDetailID, bd.BinID, bd.ProductDetailID, bd.Quantity, " +
                "       b.BinName, b.MaxCapacity, b.Status AS BinStatus, b.SectionID, " +
                "       pd.Quantity AS PD_Quantity, pd.Weight, pd.Color, pd.Size, pd.ProductImage, pd.ProductID, pd.Status " +
                "FROM BinDetail bd " +
                "JOIN Bin b ON bd.BinID = b.BinID " +
                "JOIN ProductDetail pd ON bd.ProductDetailID = pd.ProductDetailID " +
                "WHERE bd.BinID = ? " +
                "ORDER BY b.Status DESC, bd.BinID ASC";
        try (Connection conn = DBContext.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, binID);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                BinDetail binDetail = new BinDetail();
                binDetail.setBinDetailId(rs.getString("BinDetailID"));
                binDetail.setBinId(rs.getString("BinID"));
                binDetail.setProductDetailId(rs.getString("ProductDetailID"));
                binDetail.setQuantity(rs.getInt("Quantity"));
                binDetail.setStatus(rs.getInt("Status"));
                binDetail.setColor(rs.getString("Color"));
                binDetail.setSize(rs.getString("Size"));
                binDetail.setImage(rs.getString("ProductImage"));
                list.add(binDetail);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public static void updateBinDetails(String binID, List<String> productDetailIDs, List<Integer> quantities) throws SQLException {
        if (productDetailIDs == null || quantities == null || productDetailIDs.size() != quantities.size()) {
            throw new IllegalArgumentException("Danh sách ProductDetailID và quantity không hợp lệ.");
        }

        String sql = "UPDATE bindetail SET quantity = ? WHERE binId = ? AND ProductDetailId = ?";

        try (Connection conn = DBContext.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            conn.setAutoCommit(false); // Bắt đầu transaction

            for (int i = 0; i < productDetailIDs.size(); i++) {
                stmt.setInt(1, quantities.get(i));
                stmt.setString(2, binID);
                stmt.setString(3, productDetailIDs.get(i));
                stmt.addBatch(); // Thêm vào batch
            }

            stmt.executeBatch(); // Thực thi batch update
            conn.commit(); // Commit transaction
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        }
    }

    public void createInventoryDoc(String inventoryDocID,String createdBy, Date createdDate, String binID, String status) throws SQLException {
        String sql = "INSERT INTO inventorydoc (InventoryDocID, CreatedBy, CreatedDate, BinID, Status) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = DBContext.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, inventoryDocID);
            stmt.setString(2, createdBy);
            stmt.setDate(3, createdDate);
            stmt.setString(4, binID);
            stmt.setString(5, status);
            stmt.executeUpdate();
        }
    }

    public static String generateInventoryDocID() throws SQLException {
        String sql = "SELECT MAX(InventoryDocID) FROM inventorydoc WHERE InventoryDocID LIKE 'INV%'";
        try (Connection conn = DBContext.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            if (rs.next() && rs.getString(1) != null) {
                String lastID = rs.getString(1); // Lấy ID lớn nhất hiện tại
                int num = Integer.parseInt(lastID.substring(3)); // Bỏ "INV" và lấy số
                return String.format("INV%05d", num + 1); // Tăng lên 1 và định dạng lại
            }
        }
        return "INV00001"; // Trường hợp chưa có dữ liệu
    }

    public static void updateInventoryDocStatus(String inventoryDocId, String newStatus) {
        String sql = "UPDATE inventorydoc SET Status = ? WHERE InventoryDocID = ?";

        try (Connection conn = DBContext.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, newStatus);
            pstmt.setString(2, inventoryDocId);

            int rowsAffected = pstmt.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("Cập nhật trạng thái thành công!");
            } else {
                System.out.println("Không tìm thấy InventoryDocID để cập nhật.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static List<Bin> getAllBins() {
        List<Bin> bins = new ArrayList<>();
        String sql = "SELECT * FROM Bin";  // Simple query to get all BinIDs

        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Bin bin = new Bin();
                bin.setBinID(rs.getString("BinID"));
                bin.setBinName(rs.getString("BinName"));
                bin.setMaxCapacity(rs.getDouble("MaxCapacity"));
                bin.setStatus(rs.getBoolean("Status"));
                bin.setSectionID(rs.getString("SectionID"));
                bins.add(bin);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bins;
    }

    public static List<Employee> getAllEmployee(){
        try(Connection con = DBContext.getConnection()){
            StringBuilder sql = new StringBuilder();
            sql.append(" SELECT employeeId, employeeName, email, phone, address, gender,dob,status,image,warehouseId FROM employee ");
            sql.append(" WHERE warehouseId = 'W001' ");
            sql.append(" ORDER BY employeeId");
            PreparedStatement ps = con.prepareStatement(sql.toString());
            ResultSet rs = ps.executeQuery();
            List<Employee> employees = new ArrayList<>();
            while (rs.next()) {
                Employee employee = Employee.builder()
                        .employeeID(rs.getString("EmployeeID"))
                        .employeeName(rs.getString("EmployeeName"))
                        .email(rs.getString("Email"))
                        .phone(rs.getString("Phone"))
                        .address(rs.getString("Address"))
                        .gender(rs.getBoolean("Gender"))
                        .dob(LocalDate.parse(rs.getString("Dob")))
                        .status(rs.getString("Status"))
                        .warehouseID(rs.getString("WarehouseID"))
                        .image(rs.getString("Image"))
                        .build();
                employees.add(employee);
            }
            return employees;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public static String getEmployeeIDByAccountID(String accountID) {
        String query = "SELECT e.EmployeeID FROM account e WHERE e.AccountID = ? LIMIT 1";

        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, accountID);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getString("EmployeeID"); // Trả về EmployeeID đầu tiên tìm thấy
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null; // Trả về null nếu không tìm thấy EmployeeID
    }

    public static List<SectionType> getAllSectionTypes() {
        List<SectionType> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM sectiontype";
            Connection conn = DBContext.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new SectionType(
                        rs.getInt("SectionTypeID"),
                        rs.getString("SectionTypeName"),
                        rs.getString("WarehouseID"),
                        rs.getString("Description")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public static List<Section> getSectionsByType(int sectionTypeID) {
        List<Section> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM section WHERE SectionTypeID = ?";
            Connection conn = DBContext.getConnection();

            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, sectionTypeID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Section(
                        rs.getString("SectionID"),
                        rs.getString("SectionName"),
                        rs.getInt("SectionTypeID")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public static List<Bin> getBinsBySection(String sectionID) {
        List<Bin> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM bin WHERE SectionID = ?";
            Connection conn = DBContext.getConnection();

            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, sectionID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Bin(
                        rs.getString("BinID"),
                        rs.getString("BinName"),
                        rs.getDouble("MaxCapacity"),
                        rs.getBoolean("Status"),
                        rs.getString("SectionID"),
                        null,  // currentCapacity (Không có trong DB)
                        null   // availableCapacity (Không có trong DB)
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public static List<Bin> getBinsBySectionWithStatusOne(String sectionID) {
        List<Bin> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM bin WHERE SectionID = ? AND Status = 1";
            Connection conn = DBContext.getConnection();

            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, sectionID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Bin(
                        rs.getString("BinID"),
                        rs.getString("BinName"),
                        rs.getDouble("MaxCapacity"),
                        rs.getBoolean("Status"),
                        rs.getString("SectionID"),
                        null,  // currentCapacity (Không có trong DB)
                        null   // availableCapacity (Không có trong DB)
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public static void changeBinStatus(String binID, int status) {
        String sql = "UPDATE bin SET Status = ? WHERE BinID = ?";

        try (Connection conn = DBContext.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, status);
            stmt.setString(2, binID);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }



}
