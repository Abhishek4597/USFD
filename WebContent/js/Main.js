
//*******************************************************************************************************

function checkSpecialConditions(selectedPath, inputValue1, inputValue2) {
    // Define the special paths we need to check
    const horizontalValue = inputValue1;
    const verticalValue = inputValue2;
    
    // First check if the selected path matches any special path
    if (selectedPath.includes("2,3,155") || selectedPath.includes("2,3,156") || selectedPath.includes("2,3,157")
    ) {
        // Validate the input value
        if (inputValue1 === null || inputValue1 === "") {
            return { status: 'error', message: 'Value is required' };
        }
        
        // Convert to number
        const value = Number(inputValue1);
        
        // Determine the results based on the value
        if (value >= 0 && value <= 100) {
            // For these paths, we'll show two results
            document.getElementById("resultContainer").style.display = "grid";
            document.getElementById("result1").textContent = "Defective Weld";
//             document.getElementById("result2").textContent = "Result B: ";
            
            return { 
                status: 'success', 
                result: 'Defective flash but welding joint is not accepted to remain in track it should be removed as early as possible',

                result1:"Result"+result1,
//                 result2: (value * 1.2).toFixed(2)
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
                result: 'Comming Soon',

                result1:"Result"+result1,
            };
        } 
        else if (value >= 40 && value <= 59.99) {
            document.getElementById("resultContainer").style.display = "grid";
            document.getElementById("result1").textContent = "DFWO";
            
            return { 
                status: 'success', 
                result: 'Comming Soon',

                result1:"Result"+result1,
            };
        }
        else if (value >= 60 && value <= 100) {
            document.getElementById("resultContainer").style.display = "grid";
            document.getElementById("result1").textContent = "DFWR";
            
            return { 
                status: 'success', 
                result: 'Comming Soon',

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
                result: 'Comming Soon',

                result1:"Result"+result1,
            };
        } 
        else if (value >= 20 && value <= 39.99) {
            document.getElementById("resultContainer").style.display = "grid";
            document.getElementById("result1").textContent = "DFWO";
            
            return { 
                status: 'success', 
                result: 'Comming Soon',

                result1:"Result"+result1,
            };
        }
        else if (value >= 40 && value <= 100) {
            document.getElementById("resultContainer").style.display = "grid";
            document.getElementById("result1").textContent = "DFWR";
            
            return { 
                status: 'success', 
                result: 'Comming Soon',

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
                result: 'Comming Soon',

                result1:"Result"+result1,
            };
        } 
        else if (value >= 30 && value <= 100) {
            document.getElementById("resultContainer").style.display = "grid";
            document.getElementById("result1").textContent = "DFWN";
            
            return { 
                status: 'success', 
                result: 'Comming Soon',

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
                result: 'Comming Soon',

                result1:"Result"+result1,
            };
        } 
        else if (value >= 20 && value <= 100) {
            document.getElementById("resultContainer").style.display = "grid";
            document.getElementById("result1").textContent = "DFWN";
            
            return { 
                status: 'success', 
                result: 'Comming Soon',

                result1:"Result"+result1,
            };
        }
       }
//  *******************************************************************************************************
else if (selectedPath.includes("2,2,164,171,181")|| selectedPath.includes("2,2,164,171,182")) {
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
                result: 'Comming Soon',

                result1:"Result"+result1,
            };
        } 
        else if (value >= 40 && value <= 59.99) {
            document.getElementById("resultContainer").style.display = "grid";
            document.getElementById("result1").textContent = "DFWO";
            
            return { 
                status: 'success', 
                result: 'Comming Soon',

                result1:"Result"+result1,
            };
        }
        else if (value >= 60 && value <= 100) {
            document.getElementById("resultContainer").style.display = "grid";
            document.getElementById("result1").textContent = "DFWR";
            
            return { 
                status: 'success', 
                result: 'Comming Soon',

                result1:"Result"+result1,
            };
        }}
//  *******************************************************************************************************
else if (selectedPath.includes("2,2,163,166,179")|| selectedPath.includes("2,2,163,166,180")) {
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
                result: 'Comming Soon',

                result1:"Result"+result1,
            };
        } 
        else if (value >= 30 && value <= 100) {
            document.getElementById("resultContainer").style.display = "grid";
            document.getElementById("result1").textContent = "DFWN";
            
            return { 
                status: 'success', 
                result: 'Comming Soon',

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
                result: 'Comming Soon',

                result1:"Result"+result1,
            };
        } 
        else if (value >= 20 && value <= 100) {
            document.getElementById("resultContainer").style.display = "grid";
            document.getElementById("result1").textContent = "DFWR";
            
            return { 
                status: 'success', 
                result: 'Comming Soon',

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
                result: 'Comming Soon',

                result1:"Result"+result1,
            };
        } 
        else if (value >= 20 && value <= 100) {
            document.getElementById("resultContainer").style.display = "grid";
            document.getElementById("result1").textContent = "DFWN";
            
            return { 
                status: 'success', 
                result: 'Comming Soon',

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
                result: 'Comming Soon',

                result1:"Result"+result1,
            };
        } 
        else if (value >= 20 && value <= 100) {
            document.getElementById("resultContainer").style.display = "grid";
            document.getElementById("result1").textContent = "DFWR";
            
            return { 
                status: 'success', 
                result: 'Comming Soon',

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
                result: 'Comming Soon',

                result1:"Result"+result1,
            };
        } 
        else if (value >= 20 && value <= 100) {
            document.getElementById("resultContainer").style.display = "grid";
            document.getElementById("result1").textContent = "DFWN";
            
            return { 
                status: 'success', 
                result: 'Comming Soon',

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
                result: 'Comming Soon',

                result1:"Result"+result1,
            };
        } 
        else if (value >= 40 && value <= 100) {
            document.getElementById("resultContainer").style.display = "grid";
            document.getElementById("result1").textContent = "DFWR";
            
            return { 
                status: 'success', 
                result: 'Comming Soon',

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
                result: 'Comming Soon',

                result1:"Result"+result1,
            };
        } 
        else if (value >= 30 && value <= 100) {
            document.getElementById("resultContainer").style.display = "grid";
            document.getElementById("result1").textContent = "DFWN";
            
            return { 
                status: 'success', 
                result: 'Comming Soon',

                result1:"Result"+result1,
            };
        }}
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
//  *******************************************************************************************************
 
     else if (selectedPath.includes("2,1,7,10,121,123")) {
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
    } else if (selectedPath.includes("2,1,7,10,121,124")) {
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
    } else if (selectedPath.includes("2,1,7,10,122,125")) {
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
    } else if (selectedPath.includes("2,1,7,10,122,126")) {
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
    } else if (selectedPath.includes("2,1,7,11,143,145")) {
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
    } else if (selectedPath.includes("2,1,7,11,143,146")) {
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
    } else if (selectedPath.includes("2,1,7,11,144,147")) {
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
    } else if (selectedPath.includes("2,1,7,11,144,148")) {
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
    } else if (selectedPath.includes("2,1,8,129,150")) {
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
    } else if (selectedPath.includes("2,1,8,129,151")) {
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
    } else if (selectedPath.includes("2,1,8,130,152")) {
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
    } else if (selectedPath.includes("2,1,8,130,153")) {
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
            return { status: 'success', result: 'OBSW' };
        } else if (hValue >= 15 && hValue <= 29.99 && vValue >=60 && vValue<=100) {
            return { status: 'success', result: 'OBSW' };
        } else if (hValue >= 30 && hValue <= 100 && vValue >=0 && vValue<=19.99) {
            return { status: 'success', result: 'No Reportable Defect' };
        } else if (hValue >= 30 && hValue <= 100 && vValue >=20 && vValue<=59.99) {
            return { status: 'success', result: 'OBSW' };
        } else if (hValue >= 30 && hValue <= 100 && vValue >=60 && vValue<=100) {
            return { status: 'success', result: 'IMRW' };
        } else {
            return { status: 'error', message: 'Vertical value & Horizontal Value out of range' };
        }
    }
    
    // If not a special path, return null to indicate no special handling needed
    return null;
}