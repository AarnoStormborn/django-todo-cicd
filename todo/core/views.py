from django.shortcuts import render, redirect
from .models import Task

def index(request):

    if request.method == 'GET':

        tasks = Task.objects.all()
        context = {"tasks": tasks}
        return render(request, 'index.html', context)
    
    if request.method == 'POST':

        new_task = request.POST['taskInput']
        
        Task.objects.create(task=new_task)

        tasks = Task.objects.all()
        context = {"tasks": tasks}

        return render(request, 'index.html', context)
    
def delete_task(request, id):

    task = Task.objects.get(id=id)
    task.delete()

    return redirect('index')

