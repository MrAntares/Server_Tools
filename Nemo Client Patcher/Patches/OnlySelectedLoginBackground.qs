function OnlyFirstLoginBackground() {
  return OnlySelectedBackground("2", "");
}

function OnlySecondLoginBackground() {
  return OnlySelectedBackground("", "2");
}

function OnlySelectedBackground(s1, s2) {
  ///////////////////////////////////////////////////////
  // GOAL: Replace one of the Login Backgrounds format //
  //       strings with the other                      //
  ///////////////////////////////////////////////////////
  
  //Step 1a - Prep Strings
  var fnd = "�����������̽�\\T" + s1 + "_���" + "%d-%d.bmp";
  if (s1 === "")
    fnd  += "\x00";

  var rep = s2 + "���" + "%d-%d.bmp" + "\x00";
  
  //Step 1b - Find the source format string
  var offset = exe.findString(fnd, RAW);
  if (offset === -1)
    return "Failed in Part 1";
  
  //Step 2 - Replace with the other 
  exe.replace(offset+16, rep, PTYPE_STRING);
  
  return true;
}