from Objects.Client import *


class Manager(Client):
    """
     ==============================================
               Variables Declaration
     ==============================================
    """
    _admin_id = 0

    def __init__(self, id, socket, first_name, last_name, admin_id):
        super().__init__(id, socket, first_name, last_name)
        self._admin_id = admin_id

    '''
     ==============================================
               Methods Declaration
     ==============================================
    '''
    def get_socket(self):
        return super().get_socket()

    def set_id(self, id):
        super().set_id(id)

    def get_id(self):
        return super().get_id()

    def set_first_name(self, first_name):
        super().set_first_name(first_name)

    def get_first_name(self):
        return super().get_first_name()

    def set_last_name(self, last_name):
        super().set_last_name(last_name)

    def get_last_name(self):
        return super().get_last_name()

    def set_admin_id(self, admin_id):
        self._admin_id = admin_id

    def get_admin_id(self):
        return self._admin_id

    def to_string(self):
        return super().to_string()
