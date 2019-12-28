import datetime
from django.http import JsonResponse
from django.db.models import Sum, F
from .models import PurchaseInvoice


def purchase_data(request, **kwargs):
    from_date = (datetime.datetime.now() - datetime.timedelta(days=6)).date()
    to_date = datetime.datetime.today()
    data = PurchaseInvoice.objects.filter(entry_date__range=(from_date, to_date)).values('entry_date').annotate(
        amount=Sum('amount')
    )
    return JsonResponse(list(data), safe=False)
