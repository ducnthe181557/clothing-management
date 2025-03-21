package org.example.clothingmanagement.service;

import org.example.clothingmanagement.entity.Section;
import org.example.clothingmanagement.repository.DBContext;
import org.example.clothingmanagement.repository.SectionDAO;

import java.util.List;
import java.util.Optional;

public class SectionService {
    private final SectionDAO sd = new SectionDAO();

    public List<Section> getAllSection(){
        return sd.getAllSection();
    }

    public List<Section> getSectionsBySectionTypeId(int sectionTypeId){
        return sd.getSectionsBySectionTypeId(sectionTypeId);
    }

    public Optional<Section> getSectionById(String sectionId){
        return sd.getSectionById(sectionId);
    }

    public List<Section> getSectionsWithPagination(int sectionTypeId,int page, int pageSize){
        return sd.getSectionsWithPagination(sectionTypeId,page,pageSize);
    }
    public List<Section> SearchSectionWithPagination(int sectionTypeId,String nameSearch,int page, int pageSize){
        return sd.searchSectionWithPagination(sectionTypeId,nameSearch,page,pageSize);
    }
    public List<Section> searchSectionWithoutPagination(int sectionTypeId,String nameSearch){
        return sd.searchSectionWithoutPagination(sectionTypeId,nameSearch);
    }
    public String getSectionByBin(String binID) {
        return sd.getSectionByBin(binID);
    }

    public List<Section> getSectionsBySectionTypeIsReceiptStorage() {
        return sd.getSectionsBySectionTypeIsReceiptStorage();
    }

    public List<Section> getSectionsWithBinCount(int page, int pageSize, String sectionId){
        return sd.getSectionsWithBinCount(page,pageSize, sectionId);
    }

    public int getTotalSections(){
        return sd.getTotalSections();
    }

    public static void main(String[] args){
        SectionService ss = new SectionService();
        List<Section> list = ss.SearchSectionWithPagination(2,"b",1,5);
        for(Section section : list){
            System.out.println(section);
        }

    }

}
