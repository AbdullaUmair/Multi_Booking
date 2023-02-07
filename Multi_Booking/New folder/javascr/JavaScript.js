/*digitalx library 

filterSelection("all")
function filterSelection(c) {
    var x, i;
    x = document.getElementsByClassName("filterDiv");
    if (c == "all") c = "";
    for (i = 0; i < x.length; i++) {
        w3RemoveClass(x[i], "show");
        if (x[i].className.indexOf(c) > -1) w3AddClass(x[i], "show");
    }
}

function w3AddClass(element, name) {
    var i, arr1, arr2;
    arr1 = element.className.split(" ");
    arr2 = name.split(" ");
    for (i = 0; i < arr2.length; i++) {
        if (arr1.indexOf(arr2[i]) == -1) { element.className += " " + arr2[i]; }
    }
}

function w3RemoveClass(element, name) {
    var i, arr1, arr2;
    arr1 = element.className.split(" ");
    arr2 = name.split(" ");
    for (i = 0; i < arr2.length; i++) {
        while (arr1.indexOf(arr2[i]) > -1) {
            arr1.splice(arr1.indexOf(arr2[i]), 1);
        }
    }
    element.className = arr1.join(" ");
}

// Add active class to the current button (highlight it)
var btnContainer = document.getElementById("myBtnContainer");
var btns = btnContainer.getElementsByClassName("btn");
for (var i = 0; i < btns.length; i++) {
    btns[i].addEventListener("click", function () {
        var current = document.getElementsByClassName("active");
        current[0].className = current[0].className.replace(" active", "");
        this.className += " active";
    });
}
*/



/*task 1*/
var currentTab = 0; // Current tab is set to be the first tab (0)
showTab(currentTab); // Display the current tab

function showTab(n) {
	// This function will display the specified tab of the form...
	var x = document.getElementsByClassName("tab");
	x[n].style.display = "block";
	//... and fix the Previous/Next buttons:
	if (n == 0) {
		document.getElementById("prevBtn").style.display = "none";
	} else {
		document.getElementById("prevBtn").style.display = "inline";
	}
	if (n == (x.length - 1)) {
		document.getElementById("nextBtn").innerHTML = "Submit";
	} else {
		document.getElementById("nextBtn").innerHTML = "Next";
	}
	//... and run a function that will display the correct step indicator:
	fixStepIndicator(n)
}

function nextPrev(n) {
	// This function will figure out which tab to display
	var x = document.getElementsByClassName("tab");
	// Exit the function if any field in the current tab is invalid:
	if (n == 1 && !validateForm()) return false;
	// Hide the current tab:
	x[currentTab].style.display = "none";
	// Increase or decrease the current tab by 1:
	currentTab = currentTab + n;
	// if you have reached the end of the form...
	if (currentTab >= x.length) {
		// ... the form gets submitted:
		document.getElementById("regForm").submit();
		return false;
	}
	// Otherwise, display the correct tab:
	showTab(currentTab);
}

function validateForm() {
	// This function deals with validation of the form fields
	var x, y, i, valid = true;
	x = document.getElementsByClassName("tab");
	y = x[currentTab].getElementsByTagName("input");
	// A loop that checks every input field in the current tab:
	for (i = 0; i < y.length; i++) {
		// If a field is empty...
		if (y[i].value == "") {
			// add an "invalid" class to the field:
			y[i].className += " invalid";
			// and set the current valid status to false
			valid = false;
		}
	}
	// If the valid status is true, mark the step as finished and valid:
	if (valid) {
		document.getElementsByClassName("step")[currentTab].className += " finish";
	}
	return valid; // return the valid status
}

function fixStepIndicator(n) {
	// This function removes the "active" class of all steps...
	var i, x = document.getElementsByClassName("step");
	for (i = 0; i < x.length; i++) {
		x[i].className = x[i].className.replace(" active", "");
	}
	//... and adds the "active" class on the current step:
	x[n].className += " active";
}



		/*jQuery(document).ready( function(){

			$('.tab-action-btn-next').on( 'click', function(e) {
				let elementTab = $(this).parents('.tab-pane');
				$('#booking').valid();
				let errors = elementTab.find('.required.error').length;
				console.log( errors );
				if( errors > 0 ) {
					$('#tab-reservation > .active').nextAll('a').addClass('disabled');
					return false;
				} else {
					$('#tab-reservation > .active').next('a').removeClass('disabled').trigger('click');
					let nextTabEl = $('#tab-reservation > .active').next('a').removeClass('disabled'),
						tab = new bootstrap.Tab( nextTabEl.get(0) );

					tab.show();
					e.preventDefault();
					return false;
				}
			});

			let date		= new Date(),
				today		= new Date(date.getFullYear(), date.getMonth(), date.getDate() + 1),
				tomorrow	= new Date(date.getFullYear(), date.getMonth(), date.getDate() + 2),
				checkIn		= $( '#booking-check-in' ),
				checkOut	= $( '#booking-check-out' );

			$('.travel-date-group').datepicker({
				autoclose: true,
				todayHighlight: true,
				startDate: "0 days",
				format: "mm/dd/yyyy"
			}).on('changeDate', function(){
				let dayCheckin = new Date( checkIn.prop('value') ),
					dayCheckout = new Date( checkOut.prop('value') ),
					nights = ( dayCheckout.getTime() - dayCheckin.getTime() ) / (1000 * 3600 * 24);
				$( ".time-value" ).html( nights + ' Nights' );
			});

			$('#booking-card-exp').datepicker({
				autoclose: true,
				todayHighlight: true,
				startDate: "0 days",
				format: "mm/yyyy"
			});

			checkIn.datepicker( 'setDate', today );
			checkOut.datepicker( 'setDate', tomorrow );

			let elemRoomType	= 'Standard Room',
				roomType		= $( 'input[name="booking-room-type"]' ),
				elemRooms		= '',
				rooms			= $( 'select[name="booking-rooms"]' ),
				elempersons		= '',
				persons			= $( 'select[name="booking-persons"]' );


			roomType.change(function(){
				elemRoomType = $(this).prop('value');
				$( ".room-type-value" ).html( elemRoomType );
			});

			rooms.change(function(){
				elemRooms = $(this).prop('value');
				$( ".rooms-value" ).html( elemRooms );
			});

			persons.change(function(){
				elempersons = $(this).prop('value');
				$( ".persons-value" ).html( elempersons );
			});

			$('#booking').on( 'formSubmitSuccess', function(){
				$( '.travel-date-group input' ).datepicker( 'setDate', today );
				$( ".room-type-value" ).html( 'Standard Room' );
				$( ".time-value" ).html( 'Choose Date' );
				$( ".rooms-value" ).html( '1 Room' );
				$( ".persons-value" ).html( '1 Person' );
				$( '#tab-reservation-payment' ).removeClass('active');
			});
		});*/
	


function openCity(evt, cityName) {
  var i, tabcontent, tablinks;
  tabcontent = document.getElementsByClassName("tabcontent");
  for (i = 0; i < tabcontent.length; i++) {
    tabcontent[i].style.display = "none";
  }
  tablinks = document.getElementsByClassName("tablinks");
  for (i = 0; i < tablinks.length; i++) {
    tablinks[i].className = tablinks[i].className.replace(" active", "");
  }
  document.getElementById(cityName).style.display = "block";
  evt.currentTarget.className += " active";
}
