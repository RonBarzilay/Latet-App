from Objects.Client import *


class Admin(Client):
    def __init__(self, id, socket, first_name, last_name):
        super().__init__(id, socket, first_name, last_name)

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

    def to_string(self):
        return super().to_string() + self.get_manager_id()


