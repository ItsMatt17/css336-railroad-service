package com.cs336.pkg;

import java.time.LocalDateTime;

public record Reservation(int id, Route route, LocalDateTime arrTime, LocalDateTime destTime, LocalDateTime creation,
                          Discount discount, TicketType ticketType,
                          int trainId) {}
