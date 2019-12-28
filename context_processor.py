from django.db.models import Sum, Count
from UTMS.settings import client
from complaint.models import Complaint
from ticketing.models import TicketSale
from vehicle.forms import VehicleForm
import datetime

from vehicle.models import VehicleInfo


def clients(request):
    university = client
    vehicle_form = VehicleForm()
    # import pdb; pdb.set_trace()
    from_date = datetime.date.today().replace(day=1)
    to_date = datetime.datetime.today()
    ticket_sale = TicketSale.objects.filter(applied_date__range=(from_date, to_date)).aggregate(
        amount=Sum('total_amount'),
    )
    major_routes = TicketSale.objects.filter(applied_date__range=(from_date, to_date)).values('vehicle_id').annotate(
        ticket=Count('id'),
    )
    major_route_list = []
    final_list = []
    for i in range(3):
        max = 0
        for j in major_routes:
            if j['ticket'] > max and j['ticket'] not in final_list:
                max = j['ticket']
        final_list.append(max)
    for i in range(3):
        for j in major_routes:
            count = 0
            if j['ticket'] == final_list[i]:
                vehicle_id = j['vehicle_id']
                route = VehicleInfo.objects.get(pk=vehicle_id).route.display_text
                major_route_list.append(route)
                count += 1
            if count == 1:
                break
    complaint = Complaint.objects.filter(incident_date__range=(from_date, to_date)).aggregate(
        com=Count('id')
    )
    return {
        'sale_amount': ticket_sale,
        'university': university,
        'vehicle_form': vehicle_form,
        'major_routes': major_route_list,
        'complaint': complaint
    }
