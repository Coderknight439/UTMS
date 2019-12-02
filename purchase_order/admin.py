from django.contrib import admin
from .models import *


class ProductInline(admin.TabularInline):
    model = PurchaseProduct
    extra = 1
    can_delete = True


@admin.register(PurchaseInvoice)
class PurchaseInvoiceAdmin(admin.ModelAdmin):
    exclude = ['entry_date', 'amount', 'created_by', 'purchase_id']
    list_display = ['purchase_id', 'vendor_id', 'entry_date', 'amount']
    inlines = [
        ProductInline
    ]

    def save_model(self, request, obj, form, change):
        obj.amount = 0
        purchase = PurchaseInvoice.objects.last()
        if purchase is not None:
            purchase_id = int(purchase.purchase_id[3:])+1
        else:
            purchase_id = 101
        obj.purchase_id = 'PI-'+ str(purchase_id)
        obj.created_by = request.user
        super().save_model(request, obj, form, change)

    def save_formset(self, request, form, formset, change):
        instances = formset.save(commit = False)
        # import pdb;pdb.set_trace()
        for instance in instances:
            instance.save()
            instance.purchase_id.total_amount()
        formset.save_m2m()

