require 'pry'
class Doctor
    attr_accessor :name
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def appointments
        Appointment.all.select {|appointment| appointment.doctor == self }
    end

    def new_appointment(date, patient) #the order matters. check back to the Appointment's initialize's order
        Appointment.new(date, patient, self)
    end

    def patients
        appointments.map {|appointment| appointment.patient}
    end

end
