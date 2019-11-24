from UTMS.settings import client


def clients(request):
    university = client

    return {
        'university': university,
    }
