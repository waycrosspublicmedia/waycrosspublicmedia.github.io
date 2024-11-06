function onCreate()
    makeLuaSprite('bartop','',-750,-1200)
	makeGraphic('bartop',3000,750,'000000')
	addLuaSprite('bartop',true)

	makeLuaSprite('barbot','',-750,900)
	makeGraphic('barbot',3000,500,'000000')
	addLuaSprite('barbot',true)

	setScrollFactor('bartop', 0, 0.15);
	setScrollFactor('barbot', 0, 0.15);
end

function onSongStart()
	doTweenY('bartop', 'bartop', -690, 2, 'quintOut');
	doTweenY('barbot', 'barbot', 690, 2, 'quintOut');
end

function onStepHit ()
	    if curStep == 224 then
	    doTweenY('bartop', 'bartop', -550, 2, 'quintOut');
	    doTweenY('barbot', 'barbot', 550, 2, 'quintOut');
     	end


		 if curStep == 244 then
		 doTweenY('bartop', 'bartop', -300, 1, 'quintOut');
		 doTweenY('barbot', 'barbot', 300, 1, 'quintOut');
		 end
		 if curStep == 262 then
			doTweenY('bartop', 'bartop', -800, 0.2, 'quintOut');
	    doTweenY('barbot', 'barbot', 800, 0.2, 'quintOut');
			 end

			 if curStep == 518 then
				doTweenY('bartop', 'bartop', -570, 2, 'quintOut');
				doTweenY('barbot', 'barbot', 570, 2, 'quintOut');
				 end
				 if curStep == 775 then
					doTweenY('bartop', 'bartop', -800, 2, 'quintOut');
	                doTweenY('barbot', 'barbot', 800, 2, 'quintOut');
					 end

					 if curStep == 967 then
						doTweenY('bartop', 'bartop', -630, 2, 'quintOut');
						doTweenY('barbot', 'barbot', 630, 2, 'quintOut');
						 end
						 if curStep == 1031 then
							doTweenY('bartop', 'bartop', -800, 3, 'quintOut');
							doTweenY('barbot', 'barbot', 800, 3, 'quintOut');
							 end
							 if curStep == 1288 then
								doTweenY('bartop', 'bartop', -640, 2, 'quintOut');
								doTweenY('barbot', 'barbot', 640, 2, 'quintOut');
								 end
								 if curStep == 1543 then
									doTweenY('bartop', 'bartop', -570, 2, 'quintOut');
									doTweenY('barbot', 'barbot', 570, 2, 'quintOut');
									 end
									 if curStep == 1767 then
										doTweenY('bartop', 'bartop', -300, 12, 'quintOut');
										doTweenY('barbot', 'barbot', 300, 12, 'quintOut');
										 end

										 if curStep == 1821 then
											doTweenY('bartop', 'bartop', -570, 0.5, 'quintOut');
											doTweenY('barbot', 'barbot', 570, 0.5, 'quintOut');
											 end
											 if curStep == 1825 then
												doTweenY('bartop', 'bartop', -800, 2, 'quintOut');
												doTweenY('barbot', 'barbot', 800, 2, 'quintOut');
												 end
												 if curStep == 1951 then
													doTweenY('bartop', 'bartop', -570, 2, 'quintOut');
													doTweenY('barbot', 'barbot', 570, 2, 'quintOut');
													 end



													 if curStep == 2018 then
														doTweenY('bartop', 'bartop', -640, 2, 'quintOut');
														doTweenY('barbot', 'barbot', 640, 2, 'quintOut');
														 end


														 if curStep == 2066 then
															doTweenY('bartop', 'bartop', -520, 1, 'quintOut');
															doTweenY('barbot', 'barbot', 520, 1, 'quintOut');
															 end
														 if curStep == 2081 then
															doTweenY('bartop', 'bartop', -630, 2, 'quintOut');
															doTweenY('barbot', 'barbot', 630, 2, 'quintOut');
															 end
														 if curStep == 2209 then
															doTweenY('bartop', 'bartop', -540, 2, 'quintOut');
															doTweenY('barbot', 'barbot', 540, 2, 'quintOut');
															 end


														 if curStep == 2337 then
															doTweenY('bartop', 'bartop', -660, 2, 'quintOut');
															doTweenY('barbot', 'barbot', 660, 2, 'quintOut');
															 end
															 if curStep == 2529 then
																doTweenY('bartop', 'bartop', -550, 2, 'quintOut');
																doTweenY('barbot', 'barbot', 550, 2, 'quintOut');
																 end


																 if curStep == 2594 then
																	doTweenY('bartop', 'bartop', -800, 2, 'quintOut');
																	doTweenY('barbot', 'barbot', 800, 2, 'quintOut');
																	 end


																	 if curStep == 2785 then
																		doTweenY('bartop', 'bartop', -550, 2, 'quintOut');
																		doTweenY('barbot', 'barbot', 550, 2, 'quintOut');
																		 end
																		 if curStep == 2806 then
																		 doTweenY('bartop', 'bartop', -300, 1, 'quintOut');
																		 doTweenY('barbot', 'barbot', 300, 1, 'quintOut');
																		 end
																		 if curStep == 2820 then
																			doTweenY('bartop', 'bartop', -800, 0.2, 'quintOut');
																		doTweenY('barbot', 'barbot', 800, 0.2, 'quintOut');
																			 end
end
