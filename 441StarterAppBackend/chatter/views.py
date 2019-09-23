from django.shortcuts import render
from django.http import JsonResponse, HttpResponse
from django.db import connection
import json

def getchatts(request):
	if request.method != 'GET':
		return HttpResponse(status=404)
	cursor = connection.cursor()
	cursor.execute('SELECT * FROM chatts;')
	rows = cursor.fetchall()
	response = {}
	response['chatts'] = rows
	return JsonResponse(response)


def adduser(request):
	if request.method != 'POST':
		return HttpResponse(status=404)
	json_data = json.loads(request.body)
	username = json_data['username']
	name = json_data['name']
	email = json_data['email']
	cursor = connection.cursor()
	cursor.execute('INSERT INTO users (username, name, email) VALUES '
				   '(%s, %s, %s);', (username, name, email))
	return JsonResponse({})


def addchatt(request):
	if request.method != 'POST':
		return HttpResponse(status=404)
	json_data = json.loads(request.body)
	username = json_data['username']
	message = json_data['message']
	cursor = connection.cursor()
	cursor.execute('INSERT INTO chatts (username, message) VALUES '
                   '(%s, %s);', (username, message))
	return JsonResponse({})

	
