from django.shortcuts import render

# Create your views here.

def home(request):
    return render(request,'index.html')

def galeria(request):
    return render(request, 'galeria.html')

def historia(request):
    return render(request, 'historia.html')
