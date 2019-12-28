from choices import vehicle_type, first_name_list, last_name_list, employee_id_list
from complaint.models import Complaint
from purchase_order.models import PurchaseInvoice, PurchaseProduct
from route.models import RouteInfo
from ticketing.models import TicketSale
from transport_schedule.models import *
from drivers.models import Driver, Staff
import random
from decimal import Decimal
import faker
import datetime


class Seeder:

    def __init__(self):
        self.first_name = first_name_list
        self.last_name = last_name_list
        self.vehicle_number = [str(i) for i in range(106, 123)]
        unwanted_number = {6, 7, 8, 11, 12, 21}
        self.vehicle_list = [i for i in range(4, 28) if i not in unwanted_number]

    def vehicle_seed(self):
        for x in range(8):
            vehicle = VehicleInfo.objects.create(
                vehicle_number = 'Bus-'+self.vehicle_number[x],
                color = random.choice([i for i in range(7)]),
                vehicle_type = '1',
                license_number = random.randint(7345673, 8567987),
                capacity = random.randint(25, 52),
                status = random.choice(['0', '1', '2']),
                route_id = random.choice([i for i in range(1, 34)])
            )
            vehicle.save()

    def route_seed(self):
        num = [i for i in range(15, 35)]
        dest_list = ['Motijheel', 'Mirpur', 'Farmgate', 'Gazipur', 'Ashulia', 'Savar', 'Jatrabari',
                     'Kachpur', 'Ajompur', 'Dhanmondi', 'Mohammadpur', 'Khilgaon', 'Jashimuddin', 'Airport', 'Narshingdi',
                     'Chourasta', 'Rampura', 'Badda', 'Sayedabad', 'Gabtoli']
        for x in range(20):
            route = RouteInfo.objects.create(
                route_number = num[x],
                slug = num[x],
                start_stoppage = 'Campus',
                destination = dest_list[x],
                created_by = 'su',
                updated_by = 'su',
                display_text = 'Campus-'+dest_list[x],
            )
            route.save()

    def complaint_seed(self):
        fake = faker.Faker()
        start_date = datetime.date(year=2019, month=9, day=1)
        end_date = datetime.date(year=2019, month=12, day=15)
        x = [str(i) for i in range(1930101, 1930106)]
        y = [str(i) for i in range(1930401, 1930405)]
        z = [str(i) for i in range(1930101, 1930106)]
        student_list = x + y + z
        for j in range(20):
            complaint = Complaint.objects.create(
                complaint_type=random.choice([str(i) for i in range(3)]),
                incident_date=fake.date_between(start_date=start_date, end_date=end_date),
                complaint_by=random.choice(student_list),
                status=random.choice([str(i) for i in range(4)]),
                bus_number_id=random.choice(self.vehicle_list),
                feedback=random.choice([str(i) for i in range(0, 6)])
            )
            complaint.save()

    def ticket_sale_seed(self):
        fake = faker.Faker()
        start_date = datetime.date(year=2019, month=9, day=1)
        end_date = datetime.date(year=2019, month=12, day=15)
        x = [str(i) for i in range(1930101, 1930106)]
        y = [str(i) for i in range(1930401, 1930405)]
        z = [str(i) for i in range(1930101, 1930106)]
        student_list = x + y + z
        number_list = [str(i) for i in range(200, 255)]
        for j in range(50):
            ticket = TicketSale.objects.create(
                ticket_type='30',
                vehicle_id_id=random.choice(self.vehicle_list),
                issued_for=random.choice(student_list),
                applied_date=fake.date_between(start_date=start_date, end_date=end_date),
                total_amount=6*30,
                payment_type='0',
                ticket_number='T-'+number_list[j],
                voucher_number='SI-' + number_list[j],
            )
            ticket.save()

    def purchase_seed(self):
        fake = faker.Faker()
        start_date = datetime.date(year=2019, month=12, day=23)
        end_date = datetime.date(year=2020, month=1, day=1)
        purchase_id_list = [str(i) for i in range(106, 175)]
        purchase_id = 7
        product_name_list = ['Gas', 'Oil', 'Tire', 'Wheel', 'Service', 'Glass', 'Seat', 'Mirror']
        vendor_list = [i for i in range(1, 8)]
        for i in range(50):
            mrp = random.randint(85, 5000)
            product = random.choice(product_name_list),
            discount = random.randint(0, 30)
            quantity = random.randint(1, 6)
            actual_amount = mrp*quantity
            paid_amount = actual_amount-(actual_amount*(discount/100))
            purchase_invoice = PurchaseInvoice.objects.create(
                purchase_id='PI-'+purchase_id_list[i],
                entry_date=fake.date_between(start_date=start_date, end_date=end_date),
                vehicle_id_id=random.choice(self.vehicle_list),
                vendor_id_id=random.choice(vendor_list),
                created_by_id=1,
                purpose=product,
                amount=paid_amount
            )
            purchase_invoice.save()
            purchase_product = PurchaseProduct.objects.create(
                product_name=product,
                quantity=quantity,
                mrp=mrp,
                discount=discount,
                purchase_id_id=purchase_id
            )
            purchase_product.save()
            purchase_id += 1
