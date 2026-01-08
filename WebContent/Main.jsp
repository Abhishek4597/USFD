<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.sql.*, com.mvc.dao.*, com.mvc.beans.*, java.util.*"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Railway Testing Conditions</title>
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap"
	rel="stylesheet">
<script type="text/javascript" src="js/jquery-1.10.2.js"></script>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script src="js/app-ajax.js" type="text/javascript"></script>
<%
	List<USFD_head_beans> HList = DDL.getUSFDHeads();
	request.setAttribute("uheads", HList);
%>
<link href="Main.css" rel="stylesheet" type="text/css">

</head>

<body>
	<div class="container">
		<div class="header">
			<h2>USFD MODULE ( Trial Version )</h2>
		</div>

		<div class="form-group">
			<label for="usfdheads"></label>

			<select name="courseid" id="usfdheads" style="display: none;"
				onchange="getUsfdMenus(this.value); toggleFormCard(this.value);">
				<option value="Select" selected="selected">-- Select Head
					--</option>
				<c:forEach items="${uheads}" var="element">
					<option value="${element.headid}">${element.headname}</option>
				</c:forEach>
			</select>

			<div class="card-grid">
				<c:forEach items="${uheads}" var="element">
					<div class="card"
						onclick="resetAllSelections(); document.getElementById('usfdheads').value='${element.headid}'; 
                   getUsfdMenus('${element.headid}'); 
                   highlightCard(this);
                   toggleFormCard('${element.headid}');"
						data-value="${element.headid}">${element.headname}</div>
				</c:forEach>
			</div>
		</div>
		<div class="form-card" style="display: none;">
			<div class="dynamic-grid">
				<div id="dynamicDropdownContainer"></div>
				<div id="textInputContainer" class="text-input-container"
					style="display: none;">
					<div class="text-input-group">
						<label for="input1">Horizontal Movement</label> <input type="text"
							id="input1" name="input1" placeholder="Enter Horizontal value"
							required="required" pattern="[0-9]*\.?[0-9]*"
							oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1')">
					</div>
					<div class="text-input-group">
						<label for="input2">Vertical Movement</label> <input type="text"
							id="input2" name="input2" placeholder="Enter Vertical value"
							required="required" pattern="[0-9]*\.?[0-9]*"
							oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1')">
					</div>
				</div>

				<div id="singleTextInputContainer"
					class="single-text-input-container" style="display: none;">
					<div class="text-input-group">
						<label for="singleInput">Enter Value</label> <input type="text"
							id="singleInput" name="singleInput" placeholder="Enter value"
							required="required" pattern="[0-9]*\.?[0-9]*"
							oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1')">
					</div>
				</div>
			</div>
			<div id="dynamicButtonContainer">
				<button id="dynamic-button" hidden>Submit</button>
				
			</div>
		</div>
	</div>

	<div id="resultContainer" class="results-grid-container"
		style="display: none;">
		<div class="result-box">
			<h4></h4>
			<div id="result1" class="result-value">-</div>
		</div>
	</div>
	<div class="results-grid-container">
		<div id="result-message" class="results-grid"></div>
	</div>

	<script>
        function toggleFormCard(selectedValue) {
            const formCard = document.querySelector('.form-card');
            if(selectedValue === 'Select') {
                formCard.style.display = 'none';
            } else {
                formCard.style.display = 'block';
            }
        }

        document.addEventListener('DOMContentLoaded', function() {
            const usfdheads = document.getElementById('usfdheads');
            toggleFormCard(usfdheads.value);
        });

        function resetAllSelections() {
            document.getElementById('usfdheads').value = 'Select';
            
            document.getElementById('dynamicDropdownContainer').innerHTML = '';
            
            resetInputValues();
            
            document.getElementById("textInputContainer").style.display = "none";
            document.getElementById("singleTextInputContainer").style.display = "none";
            
            document.getElementById("resultContainer").style.display = "none";
            document.getElementById("result-message").style.display = "none";
            
            document.getElementById("dynamic-button").hidden = true;
            
            document.querySelectorAll('.card').forEach(function(c) {
                c.classList.remove('selected');
            });
        }

        function resetInputValues() {
            document.getElementById("input1").value = "";
            document.getElementById("input2").value = "";
            document.getElementById("singleInput").value = "";
            document.getElementById("resultContainer").style.display = "none";
        }

        function getUsfdMenus(headId) {
            resetInputValues(); 
            var container = document.getElementById("dynamicDropdownContainer");
            container.innerHTML = ""; 
            document.getElementById("textInputContainer").style.display = "none"; 
            document.getElementById("singleTextInputContainer").style.display = "none"; 

            for (var i = 1; i <= 9; i++) {
                var formGroup = document.createElement("div");
                formGroup.className = "form-group";

                var label = document.createElement("label");
                label.textContent = "Dropdown " + i;
                label.setAttribute("for", "dropdown-" + i);

                var select = document.createElement("select");
                select.name = "dropdown-" + i;
                select.id = "dropdown-" + i;

                for (var j = 1; j <= 3; j++) {
                    var option = document.createElement("option");
                    option.value = "option" + j;
                    option.text = "Option " + j;
                    select.appendChild(option);
                }

                formGroup.appendChild(label);
                formGroup.appendChild(select);
                container.appendChild(formGroup);
            }

            document.getElementById("dynamic-button").hidden = false;
        }

function checkForSpecialPaths(selectedValues) {
    const specialPaths = [
        "2,1,7,10,121,123","2,1,7,10,121,124","2,1,7,10,122,125","2,1,7,10,122,126",
        "2,1,7,11,143,145","2,1,7,11,143,146","2,1,7,11,144,147","2,1,7,11,144,148",
        "2,1,8,129,150","2,1,8,129,151","2,1,8,130,152","2,1,8,130,153",
        "2,3,155","2,3,156","2,3,157","2,2,163,165,175","2,2,164,170,177",
        "2,2,164,170,178","2,2,163,165,176","2,2,164,171,181,297","2,2,164,171,182",
		"2,2,163,166,179,299","2,2,163,166,180","2,2,164,172,184","2,2,163,167,183",
		"2,2,163,168,187","2,2,164,173,188","2,2,164,174,186","2,2,163,169,185",
		"2,4,189,191,198","2,4,190,194,200","2,4,189,192,205","2,4,190,195,207",
		"2,4,189,193,206","2,4,190,196,208","2,5,209,214,217,256,258",
		"2,5,209,214,217,256,259","2,5,209,214,217,257,260","2,5,209,214,217,257,261",
		"2,5,209,214,218,262,264","2,5,209,214,218,262,265","2,5,209,214,218,263,266",
		"2,5,209,214,218,263,267","2,5,209,215,275,287","2,5,209,215,275,288",
		"2,5,209,215,276,289","2,5,209,215,276,290","2,5,210,293","2,5,210,292","2,2,164,171,181,298",
		"2,2,163,166,179,300"
		
    ];
    
    const currentPath = selectedValues.join(",");
    
    if (specialPaths.includes(currentPath)) {
        if (currentPath === "2,3,155" || currentPath === "2,3,156" || currentPath === "2,3,157" 
        	|| currentPath==="2,2,163,165,175" || currentPath==="2,2,164,170,177" || currentPath==="2,2,164,170,178"
        	|| currentPath==="2,2,163,165,176" || currentPath==="2,2,164,171,181,297" || currentPath==="2,2,164,171,182"
        	|| currentPath==="2,2,163,166,179,299" || currentPath==="2,2,163,166,180" || currentPath==="2,2,164,172,184"
        	|| currentPath==="2,2,163,167,183" || currentPath==="2,2,163,168,187" || currentPath==="2,2,164,173,188"
        	|| currentPath==="2,2,164,174,186" || currentPath==="2,2,163,169,185" || currentPath==="2,4,189,191,198" 
        	|| currentPath==="2,4,190,194,200" || currentPath==="2,4,189,192,205" || currentPath==="2,4,190,195,207"
           	|| currentPath==="2,4,189,193,206" || currentPath==="2,4,190,196,208" || currentPath==="2,2,164,171,181,298" 
           	|| currentPath==="2,2,163,166,179,300"|| currentPath===""|| currentPath===""|| currentPath===""|| currentPath===""|| currentPath===""
       
        )
        {
            document.getElementById("singleTextInputContainer").style.display = "block";
            document.getElementById("textInputContainer").style.display = "none";
        } else {
            document.getElementById("textInputContainer").style.display = "grid";
            document.getElementById("singleTextInputContainer").style.display = "none";
        }
    } else {
        document.getElementById("textInputContainer").style.display = "none";
        document.getElementById("singleTextInputContainer").style.display = "none";
    }
}

//*******************************************************************************************************

function checkSpecialConditions(selectedPath, inputValue1, inputValue2) {
    const horizontalValue = inputValue1;
    const verticalValue = inputValue2;
    
    if (selectedPath.includes("2,3,155") || selectedPath.includes("2,3,156") || selectedPath.includes("2,3,157")
    ) {
        if (inputValue1 === null || inputValue1 === "") {
            return { status: 'error', message: 'Value is required' };
        }
        
        const value = Number(inputValue1);
        
        if (value >= 0 && value <= 100) {
            document.getElementById("resultContainer").style.display = "grid";
            document.getElementById("result1").textContent = "Defective Weld";
            
            return { 
                status: 'success', 
                message: 'Defective flash but welding joint is not accepted to remain in track it should be removed as early as possible',

                result1:"Result"+result1,
            };
        } else {
            return { status: 'error', message: 'Value out of range (0-100)' };
        }}
//  *******************************************************************************************************
else if (selectedPath.includes("2,2,164,170,177")) {
        // Validate the input value
        if (inputValue1 === null || inputValue1 === "") {
            return { status: 'error', message: 'Value is required' };
        }
        
        // Convert to number
        const value = Number(inputValue1);
        
        // Determine the results based on the value
        if (value >= 0 && value <= 39.99) {
            document.getElementById("resultContainer").style.display = "grid";
            document.getElementById("result1").textContent = "No Reportable Defect";
            
            return { 
                status: 'success', 
                result: 'Coming Soon',

                result1:"Result"+result1,
            };
        } 
        else if (value >= 40 && value <= 59.99) {
            document.getElementById("resultContainer").style.display = "grid";
            document.getElementById("result1").textContent = "DFWO";
            
            return { 
                status: 'success', 
                result: 'Coming Soon',

                result1:"Result"+result1,
            };
        }
        else if (value >= 60 && value <= 100) {
            document.getElementById("resultContainer").style.display = "grid";
            document.getElementById("result1").textContent = "DFWR";
            
            return { 
                status: 'success', 
                result: 'Coming Soon',

                result1:"Result"+result1,
            };
        }}
//  *******************************************************************************************************
else if (selectedPath.includes("2,2,164,170,178")) {
        // Validate the input value
        if (inputValue1 === null || inputValue1 === "") {
            return { status: 'error', message: 'Value is required' };
        }
        
        // Convert to number
        const value = Number(inputValue1);
        
        // Determine the results based on the value
        if (value >= 0 && value <= 19.99) {
            document.getElementById("resultContainer").style.display = "grid";
            document.getElementById("result1").textContent = "No Reportable Defect";
            
            return { 
                status: 'success', 
                result: 'Coming Soon',

                result1:"Result"+result1,
            };
        } 
        else if (value >= 20 && value <= 39.99) {
            document.getElementById("resultContainer").style.display = "grid";
            document.getElementById("result1").textContent = "DFWO";
            
            return { 
                status: 'success', 
                result: 'Coming Soon',

                result1:"Result"+result1,
            };
        }
        else if (value >= 40 && value <= 100) {
            document.getElementById("resultContainer").style.display = "grid";
            document.getElementById("result1").textContent = "DFWR";
            
            return { 
                status: 'success', 
                result: 'Coming Soon',

                result1:"Result"+result1,
            };
        }}
//  *******************************************************************************************************
else if (selectedPath.includes("2,2,163,165,175")) {
        // Validate the input value
        if (inputValue1 === null || inputValue1 === "") {
            return { status: 'error', message: 'Value is required' };
        }
        
        // Convert to number
        const value = Number(inputValue1);
        
        // Determine the results based on the value
        if (value >= 0 && value <= 29.99) {
            document.getElementById("resultContainer").style.display = "grid";
            document.getElementById("result1").textContent = "No Reportable Defect";
            
            return { 
                status: 'success', 
                result: 'Coming Soon',

                result1:"Result"+result1,
            };
        } 
        else if (value >= 30 && value <= 100) {
            document.getElementById("resultContainer").style.display = "grid";
            document.getElementById("result1").textContent = "DFWN";
            
            return { 
                status: 'success', 
                result: 'Coming Soon',

                result1:"Result"+result1,
            };
        }
       }
//  *******************************************************************************************************
else if (selectedPath.includes("2,2,163,165,176")) {
        // Validate the input value
        if (inputValue1 === null || inputValue1 === "") {
            return { status: 'error', message: 'Value is required' };
        }
        
        // Convert to number
        const value = Number(inputValue1);
        
        // Determine the results based on the value
        if (value >= 0 && value <= 19.99) {
            document.getElementById("resultContainer").style.display = "grid";
            document.getElementById("result1").textContent = "No Reportable Defect"; 
            
            return { 
                status: 'success', 
                result: 'Coming Soon',

                result1:"Result"+result1,
            };
        } 
        else if (value >= 20 && value <= 100) {
            document.getElementById("resultContainer").style.display = "grid";
            document.getElementById("result1").textContent = "DFWN";
            
            return { 
                status: 'success', 
                result: 'Coming Soon',

                result1:"Result"+result1,
            };
        }
       }
//  *******************************************************************************************************
else if (selectedPath.includes("2,2,164,171,181,297") || selectedPath.includes("2,2,164,171,182")) {
        // Validate the input value
        if (inputValue1 === null || inputValue1 === "") {
            return { status: 'error', message: 'Value is required' };
        }
        
        // Convert to number
        const value = Number(inputValue1);
        
        // Determine the results based on the value
        if (value >= 0 && value <= 39.99) {
            document.getElementById("resultContainer").style.display = "grid";
            document.getElementById("result1").textContent = "No Reportable Defect";
            
            return { 
                status: 'success', 
                result: 'Coming Soon',

                result1:"Result"+result1,
            };
        } 
        else if (value >= 40 && value <= 59.99) {
            document.getElementById("resultContainer").style.display = "grid";
            document.getElementById("result1").textContent = "DFWO";
            
            return { 
                status: 'success', 
                result: 'Coming Soon',

                result1:"Result"+result1,
            };
        }
        else if (value >= 60 && value <= 100) {
            document.getElementById("resultContainer").style.display = "grid";
            document.getElementById("result1").textContent = "DFWR";
            
            return { 
                status: 'success', 
                result: 'Coming Soon',

                result1:"Result"+result1,
            };
        }}
    

//  *******************************************************************************************************
else if (selectedPath.includes("2,2,163,166,179,299")|| selectedPath.includes("2,2,163,166,180")) {
        // Validate the input value
        if (inputValue1 === null || inputValue1 === "") {
            return { status: 'error', message: 'Value is required' };
        }
        
        // Convert to number
        const value = Number(inputValue1);
        
        // Determine the results based on the value
        if (value >= 0 && value <= 29.99) {
            document.getElementById("resultContainer").style.display = "grid";
            document.getElementById("result1").textContent = "No Reportable Defect";
            
            return { 
                status: 'success', 
                result: 'Coming Soon',

                result1:"Result"+result1,
            };
        } 
        else if (value >= 30 && value <= 100) {
            document.getElementById("resultContainer").style.display = "grid";
            document.getElementById("result1").textContent = "DFWN";
            
            return { 
                status: 'success', 
                result: 'Coming Soon',

                result1:"Result"+result1,
            };
        }}
//  *******************************************************************************************************
else if (selectedPath.includes("2,2,164,172,184")) {
        // Validate the input value
        if (inputValue1 === null || inputValue1 === "") {
            return { status: 'error', message: 'Value is required' };
        }
        
        // Convert to number
        const value = Number(inputValue1);
        
        // Determine the results based on the value
        if (value >= 0 && value <= 19.99) {
            document.getElementById("resultContainer").style.display = "grid";
            document.getElementById("result1").textContent = "No Reportable Defect";
            
            return { 
                status: 'success', 
                result: 'Coming Soon',

                result1:"Result"+result1,
            };
        } 
        else if (value >= 20 && value <= 100) {
            document.getElementById("resultContainer").style.display = "grid";
            document.getElementById("result1").textContent = "DFWR";
            
            return { 
                status: 'success', 
                result: 'Coming Soon',

                result1:"Result"+result1,
            };
        }}
//  *******************************************************************************************************
else if (selectedPath.includes("2,2,163,167,183")) {
        // Validate the input value
        if (inputValue1 === null || inputValue1 === "") {
            return { status: 'error', message: 'Value is required' };
        }
        
        // Convert to number
        const value = Number(inputValue1);
        
        // Determine the results based on the value
        if (value >= 0 && value <= 19.99) {
            document.getElementById("resultContainer").style.display = "grid";
            document.getElementById("result1").textContent = "No Reportable Defect";
            
            return { 
                status: 'success', 
                result: 'Coming Soon',

                result1:"Result"+result1,
            };
        } 
        else if (value >= 20 && value <= 100) {
            document.getElementById("resultContainer").style.display = "grid";
            document.getElementById("result1").textContent = "DFWN";
            
            return { 
                status: 'success', 
                result: 'Coming Soon',

                result1:"Result"+result1,
            };
        }}
//  *******************************************************************************************************
else if (selectedPath.includes("2,2,164,173,188")) {
        // Validate the input value
        if (inputValue1 === null || inputValue1 === "") {
            return { status: 'error', message: 'Value is required' };
        }
        
        // Convert to number
        const value = Number(inputValue1);
        
        // Determine the results based on the value
        if (value >= 0 && value <= 19.99) {
            document.getElementById("resultContainer").style.display = "grid";
            document.getElementById("result1").textContent = "No Reportable Defect";
            
            return { 
                status: 'success', 
                result: 'Coming Soon',

                result1:"Result"+result1,
            };
        } 
        else if (value >= 20 && value <= 100) {
            document.getElementById("resultContainer").style.display = "grid";
            document.getElementById("result1").textContent = "DFWR";
            
            return { 
                status: 'success', 
                result: 'Coming Soon',

                result1:"Result"+result1,
            };
        }}
//  *******************************************************************************************************
else if (selectedPath.includes("2,2,163,168,187")) {
        // Validate the input value
        if (inputValue1 === null || inputValue1 === "") {
            return { status: 'error', message: 'Value is required' };
        }
        
        // Convert to number
        const value = Number(inputValue1);
        
        // Determine the results based on the value
        if (value >= 0 && value <= 19.99) {
            document.getElementById("resultContainer").style.display = "grid";
            document.getElementById("result1").textContent = "No Reportable Defect";
            
            return { 
                status: 'success', 
                result: 'Coming Soon',

                result1:"Result"+result1,
            };
        } 
        else if (value >= 20 && value <= 100) {
            document.getElementById("resultContainer").style.display = "grid";
            document.getElementById("result1").textContent = "DFWN";
            
            return { 
                status: 'success', 
                result: 'Coming Soon',

                result1:"Result"+result1,
            };
        }}
//  *******************************************************************************************************
else if (selectedPath.includes("2,2,164,174,186")) {
        // Validate the input value
        if (inputValue1 === null || inputValue1 === "") {
            return { status: 'error', message: 'Value is required' };
        }
        
        // Convert to number
        const value = Number(inputValue1);
        
        // Determine the results based on the value
        if (value >= 0 && value <= 39.99) {
            document.getElementById("resultContainer").style.display = "grid";
            document.getElementById("result1").textContent = "No Reportable Defect";
            
            return { 
                status: 'success', 
                result: 'Coming Soon',

                result1:"Result"+result1,
            };
        } 
        else if (value >= 40 && value <= 100) {
            document.getElementById("resultContainer").style.display = "grid";
            document.getElementById("result1").textContent = "DFWR";
            
            return { 
                status: 'success', 
                result: 'Coming Soon',

                result1:"Result"+result1,
            };
        }}
//  *******************************************************************************************************
else if (selectedPath.includes("2,2,163,169,185")) {
        // Validate the input value
        if (inputValue1 === null || inputValue1 === "") {
            return { status: 'error', message: 'Value is required' };
        }
        
        // Convert to number
        const value = Number(inputValue1);
        
        // Determine the results based on the value
        if (value >= 0 && value <= 29.99) {
            document.getElementById("resultContainer").style.display = "grid";
            document.getElementById("result1").textContent = "No Reportable Defect";
            
            return { 
                status: 'success', 
                result: 'Coming Soon',

                result1:"Result"+result1,
            };
        } 
        else if (value >= 30 && value <= 100) {
            document.getElementById("resultContainer").style.display = "grid";
            document.getElementById("result1").textContent = "DFWN";
            
            return { 
                status: 'success', 
                result: 'Coming Soon',

                result1:"Result"+result1,
            };
        }}
//  *******************************************************************************************************
else if (selectedPath.includes("2,4,189,191,198")) {
        // Validate the input value
        if (inputValue1 === null || inputValue1 === "") {
            return { status: 'error', message: 'Value is required' };
        }
        
        // Convert to number
        const value = Number(inputValue1);
        
        // Determine the results based on the value
        if (value >= 20.01 && value <= 100) {
            document.getElementById("resultContainer").style.display = "grid";
            document.getElementById("result1").textContent = "IMR";
            
            return { 
                status: 'success', 
                result: 'Coming Soon',

                result1:"Result"+result1,
            };
        } 
        else if (value >= 0 && value <= 20) {
            document.getElementById("resultContainer").style.display = "grid";
            document.getElementById("result1").textContent = "No Defect";
            
            return { 
                status: 'success', 
                result: 'Coming Soon',

                result1:"Result"+result1,
            };
        }}
    
//  *******************************************************************************************************
else if (selectedPath.includes("2,4,190,194,200")) {
        // Validate the input value
        if (inputValue1 === null || inputValue1 === "") {
            return { status: 'error', message: 'Value is required' };
        }
        
        // Convert to number
        const value = Number(inputValue1);
        
        // Determine the results based on the value
        if (value >= 20.01 && value <= 100) {
            document.getElementById("resultContainer").style.display = "grid";
            document.getElementById("result1").textContent = "IMR";
            
            return { 
                status: 'success', 
                result: 'Coming Soon',

                result1:"Result"+result1,
            };
        } 
        else if (value >= 0 && value <= 20) {
            document.getElementById("resultContainer").style.display = "grid";
            document.getElementById("result1").textContent = "No Defect";
            
            return { 
                status: 'success', 
                result: 'Coming Soon',

                result1:"Result"+result1,
            };
        }}
//  *******************************************************************************************************
else if (selectedPath.includes("2,4,189,192,205")) {
        // Validate the input value
        if (inputValue1 === null || inputValue1 === "") {
            return { status: 'error', message: 'Value is required' };
        }
        
        // Convert to number
        const value = Number(inputValue1);
        
        // Determine the results based on the value
        if (value >= 20.01 && value <= 100) {
            document.getElementById("resultContainer").style.display = "grid";
            document.getElementById("result1").textContent = "IMR";
            
            return { 
                status: 'success', 
                result: 'Coming Soon',

                result1:"Result"+result1,
            };
        } 
        else if (value >= 0 && value <= 20) {
            document.getElementById("resultContainer").style.display = "grid";
            document.getElementById("result1").textContent = "No Defect";
            
            return { 
                status: 'success', 
                result: 'Coming Soon',

                result1:"Result"+result1,
            };
        }}
//  *******************************************************************************************************
else if (selectedPath.includes("2,4,190,195,207")) {
        // Validate the input value
        if (inputValue1 === null || inputValue1 === "") {
            return { status: 'error', message: 'Value is required' };
        }
        
        // Convert to number
        const value = Number(inputValue1);
        
        // Determine the results based on the value
        if (value >= 20.01 && value <= 100) {
            document.getElementById("resultContainer").style.display = "grid";
            document.getElementById("result1").textContent = "IMR";
            
            return { 
                status: 'success', 
                result: 'Coming Soon',

                result1:"Result"+result1,
            };
        } 
        else if (value >= 0 && value <= 20) {
            document.getElementById("resultContainer").style.display = "grid";
            document.getElementById("result1").textContent = "No Defect";
            
            return { 
                status: 'success', 
                result: 'Coming Soon',

                result1:"Result"+result1,
            };
        }}
//  *******************************************************************************************************
else if (selectedPath.includes("2,4,189,193,206")) {
        // Validate the input value
        if (inputValue1 === null || inputValue1 === "") {
            return { status: 'error', message: 'Value is required' };
        }
        
        // Convert to number
        const value = Number(inputValue1);
        
        // Determine the results based on the value
        if (value >= 20.01 && value <= 100) {
            document.getElementById("resultContainer").style.display = "grid";
            document.getElementById("result1").textContent = "IMR";
            
            return { 
                status: 'success', 
                result: 'Coming Soon',

                result1:"Result"+result1,
            };
        } 
        else if (value >= 0 && value <= 20) {
            document.getElementById("resultContainer").style.display = "grid";
            document.getElementById("result1").textContent = "No Defect";
            
            return { 
                status: 'success', 
                result: 'Coming Soon',

                result1:"Result"+result1,
            };
        }}
//  *******************************************************************************************************
else if (selectedPath.includes("2,4,190,196,208")) {
        // Validate the input value
        if (inputValue1 === null || inputValue1 === "") {
            return { status: 'error', message: 'Value is required' };
        }
        
        // Convert to number
        const value = Number(inputValue1);
        
        // Determine the results based on the value
        if (value >= 20.01 && value <= 100) {
            document.getElementById("resultContainer").style.display = "grid";
            document.getElementById("result1").textContent = "IMR";
            
            return { 
                status: 'success', 
                result: 'Coming Soon',

                result1:"Result"+result1,
            };
        } 
        else if (value >= 0 && value <= 20) {
            document.getElementById("resultContainer").style.display = "grid";
            document.getElementById("result1").textContent = "No Defect";
            
            return { 
                status: 'success', 
                result: 'Coming Soon',

                result1:"Result"+result1,
            };
        }}
//  *******************************************************************************************************
else if (selectedPath.includes("2,2,164,171,181,298")) {
        // Validate the input value
        if (inputValue1 === null || inputValue1 === "") {
            return { status: 'error', message: 'Value is required' };
        }
        
        // Convert to number
        const value = Number(inputValue1);
        
        // Determine the results based on the value
        if (value >= 0 && value <= 9.99) {
            document.getElementById("resultContainer").style.display = "grid";
            document.getElementById("result1").textContent = "No Reportable Defect";
            
            return { 
                status: 'success', 
                result: 'Coming Soon',

                result1:"Result"+result1,
            };
        } 
        else if (value >= 10 && value <= 100) {
            document.getElementById("resultContainer").style.display = "grid";
            document.getElementById("result1").textContent = "DFWR";
            
            return { 
                status: 'success', 
                result: 'Coming Soon',

                result1:"Result"+result1,
            };
        }}
    
//  *******************************************************************************************************
else if (selectedPath.includes("2,2,163,166,179,300")) {
        // Validate the input value
        if (inputValue1 === null || inputValue1 === "") {
            return { status: 'error', message: 'Value is required' };
        }
        
        // Convert to number
        const value = Number(inputValue1);
        
        // Determine the results based on the value
        if (value >= 0 && value <= 9.99) {
            document.getElementById("resultContainer").style.display = "grid";
            document.getElementById("result1").textContent = "No Reportable Defect";
            
            return { 
                status: 'success', 
                result: 'Coming Soon',

                result1:"Result"+result1,
            };
        } 
        else if (value >= 10 && value <= 100) {
            document.getElementById("resultContainer").style.display = "grid";
            document.getElementById("result1").textContent = "DFWN";
            
            return { 
                status: 'success', 
                result: 'Coming Soon',

                result1:"Result"+result1,
            };
        }}
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
//  *******************************************************************************************************
 
else if (selectedPath.includes("2,1,7,10,121,123") || selectedPath.includes("2,5,209,214,217,256,258")) {
        // Validate the input values
        if (horizontalValue === null || verticalValue === null) {
            return { status: 'error', message: 'Both horizontal and vertical values are required' };
        }
        
        // Convert to numbers
        const hValue = Number(horizontalValue);
        const vValue = Number(verticalValue);
        
        // Determine the result based on vertical value
        if (hValue >= 0 && hValue <= 100 && vValue >=0 && vValue<=19.99) {
            return { status: 'success', result: 'IMR' };
        } else if (hValue >= 0 && hValue <= 100 && vValue >=20 && vValue<=100) {
            return { status: 'success', result: 'IMR' };
        } else {
            return { status: 'error', message: 'Vertical value & Horizontal Value out of range' };
        }
    } 
     
//  *******************************************************************************************************
else if (selectedPath.includes("2,1,7,10,121,124") || selectedPath.includes( "2,5,209,214,217,256,259")) {
        // Validate the input values
        if (horizontalValue === null || verticalValue === null) {
            return { status: 'error', message: 'Both horizontal and vertical values are required' };
        }
        
        // Convert to numbers
        const hValue = Number(horizontalValue);
        const vValue = Number(verticalValue);
        
        // Determine the result based on vertical value
        if (hValue >= 0 && hValue <= 49.99 && vValue >=0 && vValue<=19.99) {
            return { status: 'success', result: 'No Reportable Defect' };
        } else if (hValue >= 0 && hValue <=49.99 && vValue >=20 && vValue<=100) {
            return { status: 'success', result: 'OBS' };
        } else if (hValue >= 50 && hValue <= 100 && vValue >=0 && vValue<=19.99) {
            return { status: 'success', result: 'No Reportable Defect' };
        } else if (hValue >= 50 && hValue <= 100 && vValue >=20 && vValue<=100) {
            return { status: 'success', result: 'IMR' };
        } else {
            return { status: 'error', message: 'Vertical value & Horizontal Value out of range' };
        }
    }
//*******************************************************************************************************
else if (selectedPath.includes("2,1,7,10,122,125") || selectedPath.includes( "2,5,209,214,217,257,260")) {
        // Validate the input values
        if (horizontalValue === null || verticalValue === null) {
            return { status: 'error', message: 'Both horizontal and vertical values are required' };
        }
        
        // Convert to numbers
        const hValue = Number(horizontalValue);
        const vValue = Number(verticalValue);
        
        // Determine the result based on vertical value
        if (hValue >= 0 && hValue <= 29.99 && vValue >=0 && vValue<=19.99) {
            return { status: 'success', result: 'No Reportable Defect' };
        } else if (hValue >= 0 && hValue <= 29.99 && vValue >=20 && vValue<=100) {
            return { status: 'success', result: 'No Reportable Defect' };
        } else if (hValue >= 30 && hValue <= 100 && vValue >=0 && vValue<=19.99) {
            return { status: 'success', result: 'No Reportable Defect' };
        } else if (hValue >= 30 && hValue <= 100 && vValue >=20 && vValue<=100) {
            return { status: 'success', result: 'IMR' };
        } else {
            return { status: 'error', message: 'Vertical value & Horizontal Value out of range' };
        }
    } 
//*******************************************************************************************************
else if (selectedPath.includes("2,1,7,10,122,126") || selectedPath.includes( "2,5,209,214,217,257,261")) {
        // Validate the input values
        if (horizontalValue === null || verticalValue === null) {
            return { status: 'error', message: 'Both horizontal and vertical values are required' };
        }
        
        // Convert to numbers
        const hValue = Number(horizontalValue);
        const vValue = Number(verticalValue);
        
        // Determine the result based on vertical value
        if (hValue >= 0 && hValue <= 29.99 && vValue >=0 && vValue<=19.99) {
            return { status: 'success', result: 'No Reportable Defect' };
        } else if (hValue >= 0 && hValue <= 29.99 && vValue >=20 && vValue<=59.99) {
            return { status: 'success', result: 'No Reportable Defect' };
        } else if (hValue >= 0 && hValue <= 29.99 && vValue >=60 && vValue<=100) {
            return { status: 'success', result: 'No Reportable Defect' };
        } else if (hValue >= 30 && hValue <= 49.99 && vValue >=0 && vValue<=19.99) {
            return { status: 'success', result: 'No Reportable Defect' };
        } else if (hValue >= 30 && hValue <= 49.99 && vValue >=20 && vValue<=59.99) {
            return { status: 'success', result: 'OBS' };
        } else if (hValue >= 30 && hValue <= 49.99 && vValue >=60 && vValue<=100) {
            return { status: 'success', result: 'OBS' };
        } else if (hValue >= 50 && hValue <= 100 && vValue >=0 && vValue<=19.99) {
            return { status: 'success', result: 'No Reportable Defect' };
        } else if (hValue >= 50 && hValue <= 100 && vValue >=20 && vValue<=59.99) {
            return { status: 'success', result: 'OBS' };
        } else if (hValue >= 50 && hValue <= 100 && vValue >=60 && vValue<=100) {
            return { status: 'success', result: 'IMR' };
        } else {
            return { status: 'error', message: 'Vertical value & Horizontal Value out of range' };
        }
    } 
//*******************************************************************************************************
else if (selectedPath.includes("2,1,7,11,143,145") || selectedPath.includes( "2,5,209,214,218,262,264")) {
        // Validate the input values
        if (horizontalValue === null || verticalValue === null) {
            return { status: 'error', message: 'Both horizontal and vertical values are required' };
        }
        
        // Convert to numbers
        const hValue = Number(horizontalValue);
        const vValue = Number(verticalValue);
        
        // Determine the result based on vertical value
        if (hValue >= 0 && hValue <= 100 && vValue >=0 && vValue<=19.99) {
            return { status: 'success', result: 'IMR' };
        } else if (hValue >= 0 && hValue <= 100 && vValue >=20 && vValue<=100) {
            return { status: 'success', result: 'IMR' };
        } else {
            return { status: 'error', message: 'Vertical value & Horizontal Value out of range' };
        }
    }
 //  *******************************************************************************************************
 else if (selectedPath.includes("2,1,7,11,143,146") || selectedPath.includes( "2,5,209,214,218,262,265")) {
        // Validate the input values
        if (horizontalValue === null || verticalValue === null) {
            return { status: 'error', message: 'Both horizontal and vertical values are required' };
        }
        
        // Convert to numbers
        const hValue = Number(horizontalValue);
        const vValue = Number(verticalValue);
        
        // Determine the result based on vertical value
        if (hValue >= 0 && hValue <= 49.99 && vValue >=0 && vValue<=19.99) {
            return { status: 'success', result: 'No Reportable Defect' };
        } else if (hValue >= 0 && hValue <=49.99 && vValue >=20 && vValue<=100) {
            return { status: 'success', result: 'OBS' };
        } else if (hValue >= 50 && hValue <= 100 && vValue >=0 && vValue<=19.99) {
            return { status: 'success', result: 'No Reportable Defect' };
        } else if (hValue >= 50 && hValue <= 100 && vValue >=20 && vValue<=100) {
            return { status: 'success', result: 'IMR' };
        } else {
            return { status: 'error', message: 'Vertical value & Horizontal Value out of range' };
        }
    } 
 
//*******************************************************************************************************
else if (selectedPath.includes("2,1,7,11,144,147") || selectedPath.includes( "2,5,209,214,218,263,266")) {
        // Validate the input values
        if (horizontalValue === null || verticalValue === null) {
            return { status: 'error', message: 'Both horizontal and vertical values are required' };
        }
        
        // Convert to numbers
        const hValue = Number(horizontalValue);
        const vValue = Number(verticalValue);
        
        // Determine the result based on vertical value
        if (hValue >= 0 && hValue <= 14.99 && vValue >=0 && vValue<=19.99) {
            return { status: 'success', result: 'No Reportable Defect' };
        } else if (hValue >= 0 && hValue <= 14.99 && vValue >=20 && vValue<=100) {
            return { status: 'success', result: 'No Reportable Defect' };
        } else if (hValue >= 15 && hValue <= 100 && vValue >=0 && vValue<=19.99) {
            return { status: 'success', result: 'No Reportable Defect' };
        } else if (hValue >= 15 && hValue <= 100 && vValue >=20 && vValue<=100) {
            return { status: 'success', result: 'IMR' };
        } else {
            return { status: 'error', message: 'Vertical value & Horizontal Value out of range' };
        }
    } 
//*******************************************************************************************************
else if (selectedPath.includes("2,1,7,11,144,148") || selectedPath.includes( "2,5,209,214,218,263,267")) {
        // Validate the input values
        if (horizontalValue === null || verticalValue === null) {
            return { status: 'error', message: 'Both horizontal and vertical values are required' };
        }
        
        // Convert to numbers
        const hValue = Number(horizontalValue);
        const vValue = Number(verticalValue);
        
        // Determine the result based on vertical value
        if (hValue >= 0 && hValue <= 14.99 && vValue >=0 && vValue<=19.99) {
            return { status: 'success', result: 'No Reportable Defect' };
        } else if (hValue >= 0 && hValue <= 14.99 && vValue >=20 && vValue<=59.99) {
            return { status: 'success', result: 'No Reportable Defect' };
        } else if (hValue >= 0 && hValue <= 14.99 && vValue >=60 && vValue<=100) {
            return { status: 'success', result: 'No Reportable Defect' };
        } else if (hValue >= 15 && hValue <= 29.99 && vValue >=0 && vValue<=19.99) {
            return { status: 'success', result: 'No Reportable Defect' };
        } else if (hValue >= 15 && hValue <= 29.99 && vValue >=20 && vValue<=59.99) {
            return { status: 'success', result: 'OBS' };
        } else if (hValue >= 15 && hValue <= 29.99 && vValue >=60 && vValue<=100) {
            return { status: 'success', result: 'OBS' };
        } else if (hValue >= 30 && hValue <= 100 && vValue >=0 && vValue<=19.99) {
            return { status: 'success', result: 'No Reportable Defect' };
        } else if (hValue >= 30 && hValue <= 100 && vValue >=20 && vValue<=59.99) {
            return { status: 'success', result: 'OBS' };
        } else if (hValue >= 30 && hValue <= 100 && vValue >=60 && vValue<=100) {
            return { status: 'success', result: 'IMR' };
        } else {
            return { status: 'error', message: 'Vertical value & Horizontal Value out of range' };
        }
    }
//*******************************************************************************************************
else if (selectedPath.includes("2,1,8,129,150") || selectedPath.includes( "2,5,209,215,275,287")) {
        // Validate the input values
        if (horizontalValue === null || verticalValue === null) {
            return { status: 'error', message: 'Both horizontal and vertical values are required' };
        }
        
        // Convert to numbers
        const hValue = Number(horizontalValue);
        const vValue = Number(verticalValue);
        
        // Determine the result based on vertical value
        if (hValue >= 0 && hValue <= 29.99 && vValue >=0 && vValue<=19.99) {
            return { status: 'success', result: 'No Reportable Defect' };
        } else if (hValue >= 30 && hValue <= 100 && vValue >=0 && vValue<=19.99) {
            return { status: 'success', result: 'No Reportable Defect' };
        } else if (hValue >= 0 && hValue <=29.99 && vValue >=20 && vValue<=100) {
            return { status: 'success', result: 'No Reportable Defect' };
        } else if (hValue >= 30 && hValue <= 100 && vValue >=20 && vValue<=100) {
            return { status: 'success', result: 'IMRW' };
        } else {
            return { status: 'error', message: 'Vertical value & Horizontal Value out of range' };
        }
    }
//*******************************************************************************************************
else if (selectedPath.includes("2,1,8,129,151") || selectedPath.includes ("2,5,209,215,275,288")) {
        // Validate the input values
        if (horizontalValue === null || verticalValue === null) {
            return { status: 'error', message: 'Both horizontal and vertical values are required' };
        }
        
        // Convert to numbers
        const hValue = Number(horizontalValue);
        const vValue = Number(verticalValue);
        
        // Determine the result based on vertical value
        if (hValue >= 0 && hValue <= 29.99 && vValue >=0 && vValue<=19.99) {
            return { status: 'success', result: 'No Reportable Defect' };
        } else if (hValue >= 0 && hValue <= 29.99 && vValue >=20 && vValue<=59.99) {
            return { status: 'success', result: 'No Reportable Defect' };
        } else if (hValue >= 0 && hValue <= 29.99 && vValue >=60 && vValue<=100) {
            return { status: 'success', result: 'No Reportable Defect' };
        } else if (hValue >= 30 && hValue <= 49.99 && vValue >=0 && vValue<=19.99) {
            return { status: 'success', result: 'No Reportable Defect' };
        } else if (hValue >= 30 && hValue <= 49.99 && vValue >=20 && vValue<=59.99) {
            return { status: 'success', result: 'OBSW' };
        } else if (hValue >= 30 && hValue <= 49.99 && vValue >=60 && vValue<=100) {
            return { status: 'success', result: 'OBSW' };
        } else if (hValue >= 50 && hValue <= 100 && vValue >=0 && vValue<=19.99) {
            return { status: 'success', result: 'No Reportable Defect' };
        } else if (hValue >= 50 && hValue <= 100 && vValue >=20 && vValue<=59.99) {
            return { status: 'success', result: 'OBSW' };
        } else if (hValue >= 50 && hValue <= 100 && vValue >=60 && vValue<=100) {
            return { status: 'success', result: 'IMRW' };
        } else {
            return { status: 'error', message: 'Vertical value & Horizontal Value out of range' };
        }
    }
//*******************************************************************************************************
else if (selectedPath.includes("2,1,8,130,152") || selectedPath.includes ("2,5,209,215,276,289")) {
        // Validate the input values
        if (horizontalValue === null || verticalValue === null) {
            return { status: 'error', message: 'Both horizontal and vertical values are required' };
        }
        
        // Convert to numbers
        const hValue = Number(horizontalValue);
        const vValue = Number(verticalValue);
        
        // Determine the result based on vertical value
        if (hValue >= 0 && hValue <= 14.99 && vValue >=0 && vValue<=19.99) {
            return { status: 'success', result: 'No Reportable Defect' };
        } else if (hValue >= 0 && hValue <= 14.99 && vValue >=20 && vValue<=100) {
            return { status: 'success', result: 'No Reportable Defect' };
        } else if (hValue >= 15 && hValue <=100 && vValue >=20 && vValue<=100) {
            return { status: 'success', result: 'IMRW' };
        } else if (hValue >= 15 && hValue <= 100 && vValue >=0 && vValue<=19.99) {
            return { status: 'success', result: 'No Reportable Defect' };
        } else {
            return { status: 'error', message: 'Vertical value & Horizontal Value out of range' };
        }
    }
//*******************************************************************************************************
else if (
            selectedPath.includes("2,1,8,130,153") || selectedPath.includes("2,5,209,215,276,290")
        ) {
            if (horizontalValue === null || verticalValue === null) {
                return {
                    status: 'error',
                    message: 'Both horizontal and vertical values are required'
                };
            }

            const hValue = Number(horizontalValue);
            const vValue = Number(verticalValue);

            if (hValue >= 0 && hValue <= 14.99) {
                return { status: 'success', result: 'No Reportable Defect' };
            } else if (hValue >= 15 && hValue <= 29.99) {
                if (vValue >= 0 && vValue <= 19.99) {
                    return { status: 'success', result: 'No Reportable Defect' };
                } else if (vValue >= 20 && vValue <= 100) {
                    return { status: 'success', result: 'OBSW' };
                }
            } else if (hValue >= 30 && hValue <= 100) {
                if (vValue >= 0 && vValue <= 19.99) {
                    return { status: 'success', result: 'No Reportable Defect' };
                } else if (vValue >= 20 && vValue <= 59.99) {
                    return { status: 'success', result: 'OBSW' };
                } else if (vValue >= 60 && vValue <= 100) {
                    return { status: 'success', result: 'IMRW' };
                }
            } else {
                return {
                    status: 'error',
                    message: 'Vertical value & Horizontal Value out of range'
                };
            }
        }
    
//*******************************************************************************************************
else if (selectedPath.includes("2,5,210,293")) {
        // Validate the input values
        if (horizontalValue === null || verticalValue === null) {
            return { status: 'error', message: 'Both horizontal and vertical values are required' };
        }
        
        // Convert to numbers
        const hValue = Number(horizontalValue);
        const vValue = Number(verticalValue);
        
        // Determine the result based on vertical value
        if (hValue >= 0 && hValue <= 29.99 && vValue >=0 && vValue<=19.99) {
            return { status: 'success', result: 'No Reportable Defect' };
        } else if (hValue >= 0 && hValue <= 29.99 && vValue >=20 && vValue<=100) {
            return { status: 'success', result: 'No Reportable Defect' };
        } else if (hValue >= 30 && hValue <=100 && vValue >=0 && vValue<=19.99) {
            return { status: 'success', result: 'No Reportable Defect' };
        } else if (hValue >= 30 && hValue <= 100 && vValue >=20 && vValue<=100) {
            return { status: 'success', result: 'IMR' };
        } else {
            return { status: 'error', message: 'Vertical value & Horizontal Value out of range' };
        }
    }
    
//*******************************************************************************************************
else if (selectedPath.includes("2,5,210,292")) {
        // Validate the input values
        if (horizontalValue === null || verticalValue === null) {
            return { status: 'error', message: 'Both horizontal and vertical values are required' };
        }
        
        // Convert to numbers
        const hValue = Number(horizontalValue);
        const vValue = Number(verticalValue);
        
        // Determine the result based on vertical value
        if (hValue >= 0 && hValue <= 100 && vValue >=0 && vValue<=19.99) {
            return { status: 'success', result: 'No Reportable Defect' };
        } else if (hValue >= 0 && hValue <= 100 && vValue >=20 && vValue<=100) {
            return { status: 'success', result: 'IMR' };
        } else {
            return { status: 'error', message: 'Vertical value & Horizontal Value out of range' };
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    return null;
}
//*******************************************************************************************************

document.getElementById("dynamic-button").addEventListener("click", function() {
    try {
        var dropdowns = [];
        
        var usfdHeads = document.getElementById("usfdheads");
        if (usfdHeads) dropdowns.push(usfdHeads);
        
        var menuDropdown = document.getElementById("menuDropdown");
        if (menuDropdown) dropdowns.push(menuDropdown);
        
        var dynamicDropdowns = document.querySelectorAll('[id^="menuDropdown_"]');
        var sortedDropdowns = [];
        
        for (var i = 0; i < dynamicDropdowns.length; i++) {
            sortedDropdowns.push(dynamicDropdowns[i]);
        }
        
        sortedDropdowns.sort(function(a, b) {
            var aNum = parseInt(a.id.split('_')[1]);
            var bNum = parseInt(b.id.split('_')[1]);
            return aNum - bNum;
        });
        
        dropdowns = dropdowns.concat(sortedDropdowns);
        
        var selectedValues = [];
        for (var j = 0; j < dropdowns.length; j++) {
            var dropdown = dropdowns[j];
            if (dropdown && dropdown.value && dropdown.value !== "Select" && dropdown.value !== "") {
                selectedValues.push(dropdown.value);
            }
        }
        
        if (selectedValues.length === 0) {
            alert("Please make at least one selection");
            return;
        }
        
        var concatenatedString = selectedValues.join(",");
        console.log("Selected path:", concatenatedString);
alert("Selected path: " + concatenatedString);
        checkForSpecialPaths(selectedValues);
        
        var inputValue1 = null;
        var inputValue2 = null;
        
        if (document.getElementById("textInputContainer").style.display !== "none") {
            inputValue1 = document.getElementById("input1").value;
            inputValue2 = document.getElementById("input2").value;
            
            if (!inputValue1 || !inputValue2) {
                alert("Please fill in both text fields");
                return;
            }
        } else if (document.getElementById("singleTextInputContainer").style.display !== "none") {
            inputValue1 = document.getElementById("singleInput").value;
            
            if (!inputValue1) {
                alert("Please fill in the value field");
                return;
            }
        }
        
        const specialResult = checkSpecialConditions(concatenatedString, inputValue1, inputValue2);
        
        if (specialResult) {
            if (specialResult.status === 'error') {
                alert(specialResult.message);
                $('#result-message').html('<div class="error">' + specialResult.message + '</div>');
                $('#result-message').show();
            } else {
                if (specialResult.result1 && specialResult.result2) {
                    $('#result-message').html('<div class="success">' + specialResult.result + '</div>');
                } else {
                    $('#result-message').html('<div class="success">' + specialResult.result + '</div>');
                }
                $('#result-message').show();
            }
            return;
        }
        
        if (inputValue1 && inputValue2) {
            concatenatedString += "|" + inputValue1 + "|" + inputValue2;
        } else if (inputValue1) {
            concatenatedString += "|" + inputValue1;
        }
        
        $.ajax({
            url : 'MainServlet',
            type : 'POST',
            dataType : 'json',
            data : {
                action: 'processDropdownSelections',
                selectedPath: concatenatedString
            },
            
            success: function(response) {
                console.log("Server response:", response);
                
                if (response.status == 1) {
                    $('#result-message').html('<div class="success">' + response.message + '</div>');
                } else {
                    alert("Error: " + response.message);
                    $('#result-message').html('<div class="error">' + response.message + '</div>');
                }
            },
            error: function(xhr, status, error) {
                console.error("AJAX error:", status, error);
                var errorMessage = "Error sending data to server: ";
                
                if (xhr.responseText) {
                    try {
                        var errResponse = JSON.parse(xhr.responseText);
                        errorMessage += errResponse.message || xhr.statusText;
                    } catch (e) {
                        errorMessage += xhr.responseText;
                    }
                } else {
                    errorMessage += error;
                }
                
                alert(errorMessage);
                $('#result-message').html('<div class="error">' + errorMessage + '</div>');
            }
        });
        
    } catch (error) {
        console.error("Error processing dropdown values:", error);
        alert("An error occurred while processing your selection");
    }
});
    
function getUsfdMenus(headid) {
    resetInputValues(); 
    $.ajax({
        url : 'MainServlet',
        type : 'POST',
        dataType : 'json',
        data : {
            headid : headid,
            action : 'getUSFDHeadMenu'
        },
        success : function(responseJson) {
            if (responseJson != null) {
                let $dropdown = $('#menuDropdown');
                if ($dropdown.length === 0) {
                    $dropdown = $('<select></select>').attr('id',
                            'menuDropdown').css({
                        padding : '5px',
                        margin : '10px 0',
                        display : 'block'
                    });

                    $('#dynamicDropdownContainer')
                            .append($dropdown);
                }

                $dropdown.empty();
                $dropdown
                        .append('<option value="">-- Select Module --</option>');

                $.each(responseJson, function(index, value) {
                    const moduleName = value['module_name'];
                    const moduleId = value['module_id'];
                    $dropdown.append($('<option></option>').val(
                            moduleId).text(moduleName));
                });

                $dropdown.off('change').on('change', function() {
                    const selectedMenuId = $(this).val();
                    if (selectedMenuId) {
                        getUsfdSubMenus(selectedMenuId);
                    }
                });
            }
        },
        error : function(xhr, status, error) {
            console.error("AJAX error:", status, error);
            console.log("Response:", xhr.responseText);
            alert("An error occurred: " + xhr.responseText);
        }
    });
}

var globalCurrentDropdownId = 0;
function getUsfdSubMenus(menuid, parentDropdownId) {
    resetInputValues(); 
    
    if (typeof parentDropdownId === 'undefined') {
        parentDropdownId = null;
    }
    
    document.getElementById("textInputContainer").style.display = "none";
    document.getElementById("singleTextInputContainer").style.display = "none";
    document.getElementById("resultContainer").style.display = "none";
    
    $.ajax({
        url : 'MainServlet',
        type : 'POST',
        dataType : 'json',
        data : {
            menuid : menuid,
            action : 'getUSFDSubMenu'
        },
        success : function(responseJson) {
            if (responseJson != null && responseJson.length > 0) {
                document.getElementById("dynamic-button").style.display = "none";
                
                let currentIndex = 0;
                if (parentDropdownId) {
                    currentIndex = parseInt(parentDropdownId.split('_')[1]) || 0;
                }
                
                deleteSubsequentDropdowns(currentIndex + 1);
                
                const dropdownId = 'menuDropdown_' + (currentIndex + 1);
                let $dropdown = $('#' + dropdownId);
                
                if ($dropdown.length === 0) {
                    $dropdown = $('<select></select>')
                        .attr('id', dropdownId)
                        .css({
                            padding: '5px',
                            margin: '10px 0',
                            display: 'block'
                        });
                    
                    $('#dynamicDropdownContainer').append($dropdown);
                }
                
                $dropdown.empty()
                    .append('<option value="">-- Select Submodule --</option>');
                
                $.each(responseJson, function(index, value) {
                    const moduleName = value['module_name'];
                    const moduleId = value['module_id'];
                    $dropdown.append($('<option></option>').val(moduleId).text(moduleName));
                });
                
                $dropdown.off('change').on('change', function() {
                    const selectedMenuId = $(this).val();
                    if (selectedMenuId) {
                        getUsfdSubMenus(selectedMenuId, $(this).attr('id'));
                    }
                });
                
            } else {
                if (parentDropdownId) {
                    const currentIndex = parseInt(parentDropdownId.split('_')[1]) || 0;
                    deleteSubsequentDropdowns(currentIndex + 1);
                }
                document.getElementById("dynamic-button").style.display = "block";
                
                var dropdowns = [];
                var usfdHeads = document.getElementById("usfdheads");
                if (usfdHeads) dropdowns.push(usfdHeads);
                
                var menuDropdown = document.getElementById("menuDropdown");
                if (menuDropdown) dropdowns.push(menuDropdown);
                
                var dynamicDropdowns = document.querySelectorAll('[id^="menuDropdown_"]');
                var sortedDropdowns = [];
                
                for (var i = 0; i < dynamicDropdowns.length; i++) {
                    sortedDropdowns.push(dynamicDropdowns[i]);
                }
                
                sortedDropdowns.sort(function(a, b) {
                    var aNum = parseInt(a.id.split('_')[1]);
                    var bNum = parseInt(b.id.split('_')[1]);
                    return aNum - bNum;
                });
                
                dropdowns = dropdowns.concat(sortedDropdowns);
                
                var selectedValues = [];
                for (var j = 0; j < dropdowns.length; j++) {
                    var dropdown = dropdowns[j];
                    if (dropdown && dropdown.value && dropdown.value !== "Select" && dropdown.value !== "") {
                        selectedValues.push(dropdown.value);
                    }
                }
                
                checkForSpecialPaths(selectedValues);
            }
        },
        error : function(xhr, status, error) {
            console.error("AJAX error:", status, error);
            console.log("Response:", xhr.responseText);
            alert("An error occurred: " + xhr.responseText);
        }
    });
}

function deleteSubsequentDropdowns(startFromIndex) {
    $('[id^="menuDropdown_"]').each(function() {
        const dropdownIndex = parseInt(this.id.split('_')[1]);
        if (dropdownIndex >= startFromIndex) {
            $(this).remove();
        }
    });
}


function countMenuDropdowns() {
    const dropdowns = $('[id^="menuDropdown_"]');
    return dropdowns.length;
}

function highlightCard(card) {
    document.querySelectorAll('.card').forEach(function(c) {
        c.classList.remove('selected');
    });
    
    card.classList.add('selected');
}

document.addEventListener('DOMContentLoaded', function() {
    var dropdown = document.getElementById('usfdheads');
    var submitBtn = document.getElementById('dynamic-button');
    var resultMessage = document.getElementById('result-message');
    var dynamicContainer = document.getElementById('dynamicDropdownContainer');

    if (!dropdown || !submitBtn || !resultMessage || !dynamicContainer) {
      console.warn('One or more required elements not found');
      return;
    }

    function hideResults() {
      resultMessage.style.display = 'none';
    }

    function showResults() {
      resultMessage.style.display = 'block';
    }

    hideResults();

    dropdown.addEventListener('change', function() {
      hideResults();
    });

    var cards = document.querySelectorAll('.card-grid .card');
    for (var i = 0; i < cards.length; i++) {
      cards[i].addEventListener('click', function() {
        hideResults();
      });
    }

    dynamicContainer.addEventListener('change', function(e) {
      if (e.target && e.target.tagName === 'SELECT') {
        hideResults();
      }
    });

    submitBtn.addEventListener('click', function(e) {
      e.preventDefault();
      showResults();
    });
});
</script>
</html>