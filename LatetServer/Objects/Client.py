from abc import ABC, abstractmethod


class Client(ABC):
    from flask_socketio import SocketIO

    '''
     ==============================================
               Variables Declaration
     ==============================================
    '''
    _socket = SocketIO()
    _id = 0
    _first_name = ''
    _last_name = ''

    def __init__(self, socket, id, first_name, last_name):
        self._socket = socket
        self._id = id
        self._first_name = first_name
        self._last_name = last_name

    '''
     ==============================================
               Methods Declaration
     ==============================================
    '''
    def get_socket(self):
        return self._socket

    def set_id(self, id):
        self._id = id

    def get_id(self):
        return self._id

    def set_first_name(self, first_name):
        self._first_name = first_name

    def get_first_name(self):
        return self._first_name

    def set_last_name(self, last_name):
        self._last_name = last_name

    def get_last_name(self):
        return self._last_name

    def to_string(self):
        return self