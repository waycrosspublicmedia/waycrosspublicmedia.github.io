function onCreate()


addCharacterToList('sonicboygf', 'gf')
addCharacterToList('sonictailgf', 'gf')

end


function onUpdate()

if mustHitSection == true then
	triggerEvent('Change Character', 2, 'sonicboygf')
end
if mustHitSection == false then
triggerEvent('Change Character', 2, 'sonictailgf')
	end
end