package com.quantumquesters.emissionbackend.models;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;

@Entity
@Getter
@Setter
public class Activity {

  @Id
  @GeneratedValue(strategy= GenerationType.IDENTITY)
  @Column(name = "id")
  private Long id;

  @ManyToOne(cascade = CascadeType.ALL)
  @JoinColumn(name = "user_id", referencedColumnName = "user_id")
  @JsonIgnore
  private User user;

  @Column(name = "created_at")
  private LocalDateTime createdAt;

  @Enumerated(EnumType.STRING)
  @Column(name = "activity_type")
  private ActivityType activityType;

  @Column(name = "duration")
  private long duration;

  @Column(name = "co2")
  private Double co2InKg;

  @PrePersist
  public void prePersist() {
    this.createdAt = LocalDateTime.now();
  }


}
