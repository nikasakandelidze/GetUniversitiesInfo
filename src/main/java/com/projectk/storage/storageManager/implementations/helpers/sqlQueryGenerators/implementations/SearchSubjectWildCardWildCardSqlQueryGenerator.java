package com.projectk.storage.storageManager.implementations.helpers.sqlQueryGenerators.implementations;

import com.projectk.entities.searchEntities.SearchSubject;
import com.projectk.storage.storageManager.implementations.helpers.sqlQueryGenerators.interfaces.WildCardSqlQueryGenerator;

public class SearchSubjectWildCardWildCardSqlQueryGenerator implements WildCardSqlQueryGenerator<SearchSubject> {
    @Override
    public String generateWildCardQueryFromSearchEntity(SearchSubject searchSubject) {
        StringBuilder builder = new StringBuilder("SELECT * FROM university_subject us");
        builder.append("join faculty f on  us.faculty_id=f.faculty_id\n" +
                "join university u on f.university_id = u.id\n" +
                "where 1=1");
        if (searchSubject.getFacultyId() != null) {
            builder.append("and f.faculty_id=?");
        }
        if (searchSubject.getSubjectName() != null) {
            builder.append("and f.subject_name=?");
        }
        if (searchSubject.getUniversityId() != null && searchSubject.getFacultyId() != null) {
            builder.append("and f.faculty_id =? and u.id=?");
        }
        return builder.toString();
    }
}