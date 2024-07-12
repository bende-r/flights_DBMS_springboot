package com.flights.controller;

import com.flights.entity.Flight;
import com.flights.repository.FlightRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.Optional;

@Controller
public class FlightsController {

    @Autowired
    private FlightRepository flightRepository;

    @GetMapping("/flights")
    public String getAllFlights(Model model) {
        model.addAttribute("flightslist", flightRepository.findAll());
        return "flights";
    }

    @GetMapping("/flights/add")
    public String showAddFlightForm(Model model) {
        model.addAttribute("flight", new Flight());
        return "add-flight";
    }

    @PostMapping("/flights/add")
    public String addFlight(@ModelAttribute("flight") Flight flight) {
        flightRepository.save(flight);
        return "redirect:/flights";
    }

    @GetMapping("/flights/edit/{id}")
    public String showEditForm(@PathVariable("id") Long id, Model model) {
        Optional<Flight> optionalFlight = flightRepository.findById(id);
        if (optionalFlight.isPresent()) {
            model.addAttribute("flight", optionalFlight.get());
            return "edit-flight";
        } else {
            // Обработка случая, если рейс не найден
            return "redirect:/flights";
        }
    }

    @PostMapping("/flights/edit/{id}")
    public String editFlight(@PathVariable("id") Long id, @ModelAttribute Flight editedFlight) {
        Optional<Flight> optionalFlight = flightRepository.findById(id);
        if (optionalFlight.isPresent()) {
            Flight existingFlight = optionalFlight.get();
            // Обновляем данные
            existingFlight.setDestination(editedFlight.getDestination());
            existingFlight.setFlightNumber(editedFlight.getFlightNumber());
            existingFlight.setAircraftType(editedFlight.getAircraftType());
            existingFlight.setDepartureTime(editedFlight.getDepartureTime());
            existingFlight.setDaysOfWeek(editedFlight.getDaysOfWeek());
            // Сохраняем обновленный рейс
            flightRepository.save(existingFlight);
        }
        return "redirect:/flights";
    }

    @GetMapping("/flights/delete/{id}")
    public String showDeleteForm(@PathVariable("id") Long id, Model model) {
        Optional<Flight> optionalFlight = flightRepository.findById(id);
        if (optionalFlight.isPresent()) {
            model.addAttribute("flight", optionalFlight.get());
            return "delete-flight";
        } else {
            // Обработка случая, если рейс не найден
            return "redirect:/flights";
        }
    }

    @PostMapping("/flights/delete/{id}")
    public String deleteFlight(@PathVariable("id") Long id) {
        // Удаляем рейс по идентификатору
        flightRepository.deleteById(id);
        return "redirect:/flights";
    }

//    @GetMapping("/byDestination")
//    public String showFlightsByDestination(@RequestParam String destination, Model model) {
//        List<Flight> flights = getFlightsByDestinationSorted(destination);
//        model.addAttribute("flights", flights);
//        return "index";
//    }
//
//    @GetMapping("/byDayOfWeek")
//    public String showFlightsByDayOfWeek(@RequestParam String dayOfWeek, Model model) {
//        List<Flight> flights = getFlightsByDayOfWeekSorted(dayOfWeek);
//        model.addAttribute("flights", flights);
//        return "index";
//    }
//
//    @GetMapping("/byDayAndTime")
//    public String showFlightsByDayAndTime(@RequestParam String dayOfWeek, @RequestParam LocalTime departureTime, Model model) {
//        List<Flight> flights = getFlightsByDayAndTimeSorted(dayOfWeek, departureTime);
//        model.addAttribute("flights", flights);
//        return "index";
//    }
//
//    public List<Flight> getFlightsByDestinationSorted(String destination) {
//        List<Flight> flights = flightRepository.findByDestination(destination);
//        return flights.stream().sorted(Comparator.comparing(Flight::getDepartureTime)).collect(Collectors.toList());
//    }
//
//    public List<Flight> getFlightsByDayOfWeekSorted(String dayOfWeek) {
//        List<Flight> flights = flightRepository.findByDayOfWeek(dayOfWeek);
//        return flights.stream().sorted(Comparator.comparing(Flight::getDepartureTime)).collect(Collectors.toList());
//    }
//
//    public List<Flight> getFlightsByDayAndTimeSorted(String dayOfWeek, LocalTime departureTime) {
//        List<Flight> flights = flightRepository.findByDayOfWeekAndDepartureTimeGreaterThan(dayOfWeek, departureTime);
//        return flights.stream().sorted(Comparator.comparing(Flight::getDepartureTime)).collect(Collectors.toList());
//    }
}