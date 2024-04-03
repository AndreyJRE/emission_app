package com.quantumquesters.emissionbackend.repository;

import com.quantumquesters.emissionbackend.models.Activity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.time.LocalDate;
import java.util.List;

public interface ActivityRepository extends JpaRepository<Activity, Long> {


    @Query("SELECT a FROM Activity a WHERE a.user.username = :username")
    List<Activity> findActivitiesByUsername(String username);

    @Query("SELECT a FROM Activity a WHERE a.user.username = ?1 and FUNCTION('DATE', a.createdAt) = ?2")
    List<Activity> findActivitiesByUsernameAndDate(String username, LocalDate dateOfActivity);
}
