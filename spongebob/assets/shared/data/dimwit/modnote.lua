function onCreate()
    for i = 0, getProperty('unspawnNotes.length') do
        if not getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
            setPropertyFromGroup('unspawnNotes', i, 'multSpeed', 0.6)
        end
    end
end