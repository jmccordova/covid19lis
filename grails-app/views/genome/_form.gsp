<div class="row">
    <div class="col">
		<div class="card">
		    <div class="card-header">
		        <strong>Specimen</strong>
		        <small>Form</small>
		    </div>
		    <div class="card-body">
		    	<div class="form-group">
					<label for="specimen.id">
						Specimen
						<span class="required-indicator">*</span>
					</label>
					<g:set var="specimenService" bean="specimenService"/>
					<% def specimenInstance = genomeInstance ? genomeInstance?.specimen : ph.edu.upm.nih.covid19lis.info.Specimen.findById(params.long('specimen')) %>
					<g:select name="specimen.id" id="specimen.id" class="validate select2" class="form-control" value="${specimenInstance?.id}" from="${specimenService.getAllForSequencing()}" optionKey="id" optionValue="specimenNum" noSelection="['':'Select Specimen']" required=""/>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="row">
    <div class="col">
		<div class="card">
		    <div class="card-header">
		        <strong>Genomic Information</strong>
		        <small>Form</small>
		    </div>
		    <div class="card-body">
		    	<div class="form-group">
					<label for="dateSequenced">
						Sequence Date
						<span class="required-indicator">*</span>
					</label>
					<g:datePicker name="dateSequenced" id="dateSequenced" class="form-control" value="${genomeInstance?.dateSequenced}" precision="day" required="" />
				</div>

				<div class="form-group">
		        	<label for="strain">
						Strain/Variant
						<span class="required-indicator">*</span>
					</label>
					<g:textField name="strain" id="strain" class="form-control" value="${genomeInstance?.strain}" required="" />
		        </div>

		        <div class="form-group">
					<label for="findings">
						Findings
					</label>
					<g:textArea name="findings" id="findings" class="form-control" value="${genomeInstance?.findings}" rows="5" cols="40" />
				</div>

				<g:if test="${genomeInstance?.genomeFile}">
					<div class="form-group">
			        	<g:link action="download" id="${genomeInstance?.id}" style="pointer-events: auto;">${genomeInstance?.specimen?.specimenNum} Genome</g:link>
			        </div>
				</g:if>

				<div class="form-group">
		        	<label for="genomeFile">
						Genome Sequence
					</label>
					<g:field type="file" name="genomeFile" id="genomeFile" class="form-control" value="${genomeInstance?.genomeFile}" accept=".txt" />
		        </div>
			</div>
		</div>
	</div>
</div>