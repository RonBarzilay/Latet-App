import json
import datetime
from DB.DBLatet import *
from Objects.Report import *

"""
Properties Declaration
"""
open_reports = []
test_report = Report("10", "11", "11.11.2000", "123456")
open_reports.append(test_report)
db = DBLatet()

# todo: functions in logic that access functions in db by: db.function()
'''
 ==============================================
           Functions Declaration
 ==============================================
'''


def serialize_volunteers_data(volunteers_list):
    '''
    This function gets input of all volunteers as a list from db and make sure
    all items can be serialized
    :param volunteers_list:
    :return: volunteers_list serialized
    '''
    for vol_index, volunteer in enumerate(volunteers_list):
        volunteers_list[vol_index] = list(volunteer)
        for item_index, item in enumerate(volunteer):
            if item is None:
                volunteers_list[vol_index][item_index] = ""
            if isinstance(item, datetime.date):
                volunteers_list[vol_index][item_index] = json.dumps(item, indent=4, sort_keys=True, default=str)
    return volunteers_list


def get_volunteers(unit, populationType):
    return serialize_volunteers_data(db.select_from_volunteer_table(unit, populationType))





class Logic:
    def __init__(self):
        print("Logic instance was created")

    # todo: create a function that check if _volunterr_id exist in list open_reports, if so, true else false + return result to client
    # def check_vol_status(self, vol_id):
    #     for report in range(open_reports):
    #         if vol_id == report.get
    #             print("a")
