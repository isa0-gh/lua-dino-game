LOVE_FILE_NAME=game.love

lovefile:
	zip -9 -r ${LOVE_FILE_NAME} . -x "*.git*" "*.DS_Store*" ${LOVE_FILE_NAME}
clean:
	rm -f ${LOVE_FILE_NAME}
