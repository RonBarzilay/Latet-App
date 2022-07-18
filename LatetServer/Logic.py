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


def get_volunteers(unit, populationType):
    return db.select_from_volunteer_table(unit, populationType)

def get_voluteers_details(id):
    return db.select_details_from_volunteer_table(id)

class Logic:
    def __init__(self):
        print("Logic instance was created")

    # todo: create a function that check if _volunterr_id exist in list open_reports, if so, true else false + return result to client
    # def check_vol_status(self, vol_id):
    #     for report in range(open_reports):
    #         if vol_id == report.get
    #             print("a")
