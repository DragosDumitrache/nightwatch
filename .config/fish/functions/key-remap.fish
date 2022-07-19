#/usr/local/env/fish

function key-remap
    echo 'Shh, the FBI is listening!'

    hidutil property --set '{"UserKeyMapping":
    [{"HIDKeyboardModifierMappingSrc":0x700000064,
    "HIDKeyboardModifierMappingDst":0x700000035}]
    }'

end

function undo-key-remap
    echo 'Connection is secure!'

    hidutil property --set '{"UserKeyMapping":
    [{"HIDKeyboardModifierMappingSrc":0x700000064,
    "HIDKeyboardModifierMappingDst":0x700000064}]
      }'
end
