<div class="row">
    <div class="col">
		<div class="card">
		    <div class="card-header">
		        <strong>Travel Details</strong>
		        <small>Form</small>
		    </div>
		    <div class="card-body">
		    	<div class="form-group">
					<label for="travelMode">
						Transportation
					</label>
					<g:select name="travelMode" id="travelMode" class="form-control" value="${transportationInstance?.travelMode}" from="${ph.edu.upm.nih.covid19lis.TravelMode}" optionKey="key" noSelection="['':'Select Mode']" />
				</div>
				<div class="form-group">
					<label for="origin">
						Origin
					</label>
					<g:textField name="origin" id="origin" class="form-control" value="${transportationInstance?.origin}" />
				</div>
				<div class="row">
					<div class="col-sm-6">
						<div class="form-group">
							<label for="transportationType">
								Airline/Sea Vessel/Bus/Train
							</label>
							<g:select name="transportationType" id="transportationType" class="form-control" value="${transportationInstance?.transportationType}" from="${ph.edu.upm.nih.covid19lis.TranspoType}" optionKey="key" noSelection="['':'Select Transportation']" />
						</div>
					</div>
					<div class="col-sm-6">
						<div class="form-group">
							<label for="transportationID">
								Flight/Vessel/Bus Number
							</label>
							<g:textField name="transportationID" id="transportationID" class="form-control" value="${transportationInstance?.transportationID}" />
						</div>
					</div>
				</div>				
				<div class="form-group">
					<label for="destination">
						Destination
					</label>
					<g:textField name="destination" id="destination" class="form-control" value="${transportationInstance?.destination}" />
				</div>
				<div class="row">
					<div class="col-sm-6">
						<div class="form-group">
							<label for="dateDeparture">
								Date of Departure
							</label>
							<g:datePicker name="dateDeparture" id="dateDeparture" class="form-control" value="${transportationInstance?.dateDeparture}" precision="day" />
						</div>
					</div>
					<div class="col-sm-6">
						<div class="form-group">
							<label for="dateArrival">
								Date of Arrival
							</label>
							<g:datePicker name="dateArrival" id="dateArrival" class="form-control" value="${transportationInstance?.dateArrival}" precision="day" />
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>