module.exports = (robot) ->
  userReplies = [ 'Heey',
                  'Hmmm',
                  'Woow',
                  'Yes',
                  'Oki Doki'
                ]

  enterReplies = [  'Ain\'t no sunshine before you came...',
                    'Target Acquired',
                    'Drop it like it is hot...',
                    'Lights, camera, action!!!',
                    'I see dead pixels XD',
                    'Drop the bottles in the ice...'
                  ]

  leaveReplies = [  'Are you still there?',
                    'Target lost',
                    'Searching'
                  ]

  robot.enter (msg) ->
    msg.send msg.random enterReplies

  robot.leave (msg) ->
    msg.send msg.random leaveReplies
