param([string]$eleresiut, [string]$rendezes) # elérési út és a rendezés típusa

# mi szerint rendezze

# i - idő
# n - név
# m - módosítás dátuma

$tomb = Get-ChildItem -Path $eleresiut

Foreach-Object {
    	$file = $_
	$tomb += @($file)
}

if($rendezes -eq $null){
	ForEach($file in $tomb){
		echo $file
	}
}

if($rendezes -ne 'i' -And $rendezes -ne 'n' -And $rendezes -ne 'm'){
	ForEach($file in $tomb){
		echo $file
	}
}

if($rendezes -eq 'm'){
	$tomb = $tomb | Sort-Object -Property LastWritetime
	echo $tomb
}

if($rendezes -eq 'i'){
	$tomb = $tomb | Sort-Object CreationTime
	echo $tomb
}

if($rendezes -eq 'n'){
	$tomb = $tomb | Sort-Object -Property Name 
	echo $tomb	
}