const adminGroups = ['group.owner', 'group.admin'];

const isAllowed = (playerId) => {
    const id = String(playerId);
    return adminGroups.some(g => IsPlayerAceAllowed(id, g))
        || IsPlayerAceAllowed(id, 'simple_pt.toggle');
};

exports('isAllowed', isAllowed);
