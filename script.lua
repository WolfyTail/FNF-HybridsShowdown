function opponentNoteHit(index, noteDir, noteType, isSustainNote)
    if getProperty('health') > 0.1 then
        setProperty('health', getProperty("health") - 0.003125)
    end
end

function onEvent(eventName, value1, value2)
    if eventName == 'Change Character' then
        if getProperty('health') > 1 then
            setProperty('health', 1)
        end
    end
end

time = 1;
triggered = false;
function noteMiss(index, noteDir, noteType, isSustainNote)
    if not triggered then
        triggerEvent("Health Drain", 0.5, time)
        triggered = true;
        runTimer('wait', time)
    end
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'wait' then
        triggered = false;
    end
end