class AdminArrivalRecordsController < ApplicationController

def index
	@arrival_records = ArrivalRecord.all
end

def new
end

def create
end

end
