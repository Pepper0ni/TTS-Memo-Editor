function onLoad()
 local selfScale=self.getScale()
 local params={
 function_owner=self,
 font_size=180,
 width=1500,
 height=220,
 scale={1/selfScale.x,1/selfScale.y,1/selfScale.z},
 }
 butWrapper(params,{0,0,1.2},'Log data',"Logs object data",'logData')
 butWrapper(params,{0,0,1.5},'Get Object Memo',"Retrieves the object's Memo",'getMemo')
 butWrapper(params,{0,0,2.1},'Set Memo',"Stores the current Memo on all objects on the tile",'setMemo')
 butWrapper(params,{0,0,2.4},'Clear script_state',"Sets the object's script_state to nil","clearSave")

 params.position={0,0,1.8}
 params.tooltip="The object's Memo"
 params.label='Enter Memo'
 params.alignment=3
 params.input_function="dummyFunc"
 params.font_color={0,0,0}
 self.createInput(params)
end

function butWrapper(params,pos,label,tool,func)
 params.position=pos
 params.label=label
 params.tooltip=tool
 params.click_function=func
 self.createButton(params)
end

function CheckForObjects()
 return Physics.cast({origin=self.positionToWorld{0,5.5,0},direction={0,1,0},type=3,size={2.5,1,3},max_distance=0,orientation=self.GetRotation()})
end

function getMemo(obj,color,alt)
 local zone=CheckForObjects()
 if zone then
  self.editInput({index=0,value=zone[1].hit_object.memo})
 end
end

function logData(obj,color,alt)
 local zone=CheckForObjects()
 for _,collision in pairs(zone)do
  Notes.setNotes(logString(collision.hit_object.getData()))
 end
end

function setMemo(obj,color,alt)
 local zone=CheckForObjects()
 local Memo=self.getInputs()[1].value
 for _,collision in pairs(zone)do
  collision.hit_object.memo=Memo
 end
end

function clearSave(obj,color,alt)
 local zone=CheckForObjects()
 for _,collision in pairs(zone)do
  collision.hit_object.script_state=nil
 end
end

function dummyFunc()
end
