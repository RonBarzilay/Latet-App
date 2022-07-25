import datetime
from json import dumps
import json
from flask_socketio import SocketIO
from flask import request
from Objects.Client import Client
from Objects.Admin import *
from Objects.Manager import *
from Logic import *

'''
 ==============================================
           Variables Declaration
 ==============================================
'''

app = Flask(import_name="latet")
app.config['SECRET_KEY'] = "@latet@secret@111"
users = []
connected_clients = 0
logic = Logic()
# app.debug = True


'''
 ==============================================
           Functions Declaration
 ==============================================
'''
app.config['SECRET_KEY'] = "@latet@secret@111"
# todo: ``'*'`` to allow all origins, or to ``[]`` to disable CORS handling.
socketio = SocketIO(app, cors_allowed_origins='*')


# print("socketio1", socketio)


@socketio.on('connect')
def connect():
    global users, connected_clients, socketio
    connected_clients += 1
    defined_client = Admin(socket=socketio, id=123456, first_name="Yossi", last_name="Levi")
    # Add connected client to users list after the user successfully login
    users.append(defined_client)
    print("Client connected with total of: ", connected_clients)


@socketio.on('disconnect')
def disconnect():
    global connected_clients
    connected_clients -= 1
    print("Client disconnected with total of: ", connected_clients)


@socketio.on("reports")
def return_reports(data):
    socketio.emit('get_volunteers_cards', get_volunteers("'" + data['unit'] + "'", "'" + data['populationType'] + "'"))



# print(data)
# match data:
#     case 'פקמ"ז הוצל"א':
#         print('פקמ"ז הוצל"א')
#     case 'פקמ"ז מטבח':
#         print('פקמ"ז מטבח')
#     case 'יט"ד בצ"פ 382':
#         print('יט"ד בצ"פ 382')
#     case 'בא"פ לכיש':
#         print('בא"פ לכיש')


# @socketio.on("checkVolStatus")
# def check_vol_status(data):
#     print(data)
#     # todo: Maor: emit to client ('', logic.check_vol_status())
#     # socketio.emit('message', 'הוצל"א פקמ"ז')


'''
Directing Methods
'''


@app.route("/")
def index():
    print("connection detected")
    # return "<center><h1>ברוכים הבאים לאפליקציית לתת</h1></center>"


if __name__ == '__main__':
    # webbrowser.open("http://127.0.0.1:5000/")
    # serve(app, host='localhost', port=5000)
    # db.insert_into_manager_table(1, 8, "Maor", "Zohar", "Pakmaz")
    print("Server running ...")
    socketio.run(app)
