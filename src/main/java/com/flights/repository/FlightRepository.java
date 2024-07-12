package com.flights.repository;

import com.flights.entity.Flight;
import org.springframework.data.jpa.repository.JpaRepository;

import java.time.LocalTime;
import java.util.List;

public interface FlightRepository extends JpaRepository<Flight, Long> {
}