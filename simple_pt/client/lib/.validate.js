const isAllowed = (playerId) => {
    return IsPlayerAceAllowed(String(playerId), 'simple_pt.toggle');
};

exports('isAllowed', isAllowed);
