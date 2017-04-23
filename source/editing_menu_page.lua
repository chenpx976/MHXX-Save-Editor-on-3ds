COLOR_EDITINGMENUPAGE_FONT = Color.new(255,255,255)
COLOR_EDITINGMENUPAGE_BACKGROUND = Color.new(0,0,0)
editingMenuPage = {
	visible = false,
	currentIndex = 1,
	display = function()
		----上屏
		--背景
		Screen.fillRect(0,399,0,239,COLOR_EDITINGMENUPAGE_BACKGROUND,TOP_SCREEN)
		--光标
		Font.print(theFont,155,10+editingMenuPage.currentIndex*40,"=>",COLOR_MAKA,TOP_SCREEN)
		Font.print(theFont,225,10+editingMenuPage.currentIndex*40,"<=",COLOR_MAKA,TOP_SCREEN)
		--字
		Font.print(theFont,185,50,"综合",COLOR_EDITINGMENUPAGE_FONT,TOP_SCREEN)
		Font.print(theFont,185,90,"物品",COLOR_EDITINGMENUPAGE_FONT,TOP_SCREEN)
		Font.print(theFont,185,130,"幻化",COLOR_EDITINGMENUPAGE_FONT,TOP_SCREEN)
		Font.print(theFont,185,170,"护石",COLOR_EDITINGMENUPAGE_FONT,TOP_SCREEN)
		----下屏
		display.hint = {
			{"↑↓","移动光标"},
			{"A","进入"},
			{"B","上一层"}
		}
	end,
	padLoop = function()
		editingComPage.visible = false
		editingItemPage.visible = false
		editingMenuPage.visible = true
		userSelect.visible = false
		display.mark.nextMark = {name = userSelect.userStr[userSelect.currentIndex]}
		while true do
			pad.reload()
			if pad.isPress(KEY_DUP) then
				if editingMenuPage.currentIndex>1 then
					editingMenuPage.currentIndex = editingMenuPage.currentIndex-1
				end
			end
			if pad.isPress(KEY_DDOWN) then
				if editingMenuPage.currentIndex<4 then
					editingMenuPage.currentIndex = editingMenuPage.currentIndex+1
				end
			end
			if pad.isPress(KEY_A) then
				--综合
				if editingMenuPage.currentIndex==1 then
					editingComPage.padLoop()
				end
				--物品
				if editingMenuPage.currentIndex==2 then
					editingItemPage.padLoop()
				end
				--幻化
				if editingMenuPage.currentIndex==3 then
					messageBox.show("             对不起 ，暂不支持修改幻化 ！","确认","取消")
				end
				--护石
				if editingMenuPage.currentIndex==4 then
					messageBox.show("             对不起 ，暂不支持修改护石 ！","确认","取消")
				end
			end
			if pad.isPress(KEY_B) then
				userSelect.padLoop()
			end
			display.refresh()
		end
	end
}