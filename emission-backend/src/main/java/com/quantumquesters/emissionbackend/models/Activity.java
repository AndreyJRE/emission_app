package com.quantumquesters.emissionbackend.models;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.PrePersist;
import java.time.Duration;
import java.time.LocalDateTime;
import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
public class Activity {
  @Id
  @ManyToOne(cascade = CascadeType.ALL)
  @JoinColumn(name = "userId", referencedColumnName = "userId")
  private User user;

  @Column(name = "timestamp")
  private LocalDateTime timestamp;

  @PrePersist
  public void prePersist() {
    this.timestamp = LocalDateTime.now();
  }

  @Enumerated(EnumType.STRING)
  @Column(name = "activityType")
  private ActivityType activityType;

  @Column(name = "duration")
  private Duration duration;

  @Column(name = "co2InKg")
  private Double co2InKg;


}
