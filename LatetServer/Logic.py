import json
import datetime
from DB.DBLatet import *
from Objects.Report import *


# todo: functions in logic that access functions in db by: db.function()

class Logic:

    """
     ==============================================
                    Constructor
     ==============================================
    """
    def __init__(self):
        self.open_reports = []
        print("Logic instance was created")
        self.db = DBLatet()

    """
     ==============================================
               Methods Declaration
     ==============================================    
    """
    def serialize_volunteers_data(self, volunteers_list):
        """
        This function gets input of all volunteers as a list from db and make sure
        all items can be serialized
        :param self:
        :param volunteers_list:
        :return: volunteers_list serialized
        """
        for vol_index, volunteer in enumerate(volunteers_list):
            volunteers_list[vol_index] = list(volunteer)
            # print(volunteers_list[vol_index])
            for item_index, item in enumerate(volunteer):
                if item is None:
                    volunteers_list[vol_index][item_index] = ""
                if isinstance(item, datetime.date):
                    volunteers_list[vol_index][item_index] = json.dumps(item, indent=4, sort_keys=True,
                                                                        default=str).replace('"', '')
        return volunteers_list

    def get_volunteers(self, unit, populationType):
        return self.serialize_volunteers_data(self.db.select_from_volunteer_table(unit, populationType))

    def get_voluteers_details(self, id):
        return self.db.select_details_from_volunteer_table(id)

    def create_and_append_report(self, volunteer_id):
        print(datetime.datetime.now().strftime("%H:%M"), " ", datetime.datetime.now().strftime("%d/%m/%Y"))
        new_report = Report(start=datetime.datetime.now().strftime("%H:%M"), end='',
                            date=datetime.datetime.now().strftime("%d/%m/%Y"), volunterr_id=volunteer_id)
        self.open_reports.append(new_report)
        print(new_report.to_string())

    def remove_and_send_report(self, volunteer_id):
        for report in self.open_reports:
            if report.get_volunteer_id() == volunteer_id:
                report.set_end(datetime.datetime.now().strftime("%H:%M"))
                print('just removed this report:', report.to_string())
                self.open_reports.remove(report)
        #       TODO: insert to db this report


        # todo: create a function that check if _volunterr_id exist in list open_reports, if so, true else false + return result to client
        # def check_vol_status(self, vol_id):
        #     for report in range(open_reports):
        #         if vol_id == report.get
        #             print("a")
