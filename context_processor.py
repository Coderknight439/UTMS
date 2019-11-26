from UTMS.settings import client
from vehicle.forms import VehicleForm


def clients(request):
    university = client
    vehicle_form = VehicleForm()
    # import pdb; pdb.set_trace()
    return {
        'university': university,
        'vehicle_form': vehicle_form,
    }
