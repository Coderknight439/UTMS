from transport_schedule.models import *
from random import *
from decimal import Decimal


class Seeder:

    def __init__(self):
        self.start_time = ["10:40", "11:40", "15:20", "", "Cat Food", "Dog Food"]

    def seed(self):
        for x in range(20):
            vehicle = VehicleInfo.objects.get(pk=randint(1,3))
            schedule = TransportSchedule(vehicle_route=vehicle, start_time = self.start_time)
            schedule.save()
