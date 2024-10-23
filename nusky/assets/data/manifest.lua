winX = 0
winY = 0
endedSong = false
go = 1
--local noManif = true
function onCreate()

		setProperty('camHUD.visible',false)
		triggerEvent('Set Cam Zoom',0.9,2)
--	if noManif then
		noManif = false
		winX = getPropertyFromClass('openfl.Lib','application.window.x')
		winY = getPropertyFromClass('openfl.Lib','application.window.y')

		triggerEvent('Camera Follow Pos',330,260)
		characterPlayAnim('dad','manifest',true)
		setProperty('dad.specialAnim',true)
		characterPlayAnim('bf','startle2',true)
		setProperty('bf.specialAnim',true)
		playSound('manifest',1)
		runTimer('bom',1)
		runTimer('swoshh',5)
		runTimer('go',5.2)


end

function onUpdatePost()

if endedSong then

	setPropertyFromClass('openfl.Lib','application.window.x',winX+getRandomInt(-10,10))
	setPropertyFromClass('openfl.Lib','application.window.y',winY+getRandomInt(-10,10))

end


end
function onTimerCompleted(n,l,ll)

	if n == 'bom' then
go = 1
endedSong = true
triggerEvent('Set Cam Zoom',1.6,5)
		cameraShake('game',0.05,6)
		setProperty('manifBOOM.visible',true)
		setProperty('blak.visible',true)
	end
	if n == 'swoshh' then
		endedSong = false
		cameraFade('game','000000',0.1,true)
	end
	if n == 'go' then
		endSong(true)
	end

end