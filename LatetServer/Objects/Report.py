class Report:

    """
     ==============================================
               Variables Declaration
     ==============================================
    """
    _start = None
    _end = None
    _date = None
    _volunterr_id = None

    def __init__(self, start, end, date, volunterr_id):
        self._start = start
        self._end = end
        self._date = date
        self._volunterr_id = volunterr_id

    # todo: create getter and setter methods for this class so checkVolStatus() could access _volunterr_id
    # @property
    # def start(self):
    #     print("getter of start called")
    #     return self._start

