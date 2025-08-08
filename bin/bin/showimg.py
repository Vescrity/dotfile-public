#!/bin/python3
import sys
import gi

gi.require_version('Gtk', '3.0')
gi.require_version('GtkLayerShell', '0.1')
from gi.repository import Gtk, Gdk, GtkLayerShell

class FullscreenImage(Gtk.Window):
    def __init__(self, image_path):
        super().__init__()

        # 设置窗口为全屏
        #self.set_default_size(800, 600)
        self.fullscreen()

        # 使用 gtk-layer-shell
        GtkLayerShell.init_for_window(self)
        GtkLayerShell.set_layer(self, GtkLayerShell.Layer.OVERLAY)
        GtkLayerShell.set_keyboard_mode(self, GtkLayerShell.KeyboardMode.ON_DEMAND)

        GtkLayerShell.set_exclusive_zone(self, 0)

        # 加载图片
        self.image = Gtk.Image.new_from_file(image_path)
        self.add(self.image)

        # 信号连接
        self.connect("key-press-event", self.on_key_press)
        self.connect("button-press-event", self.on_button_press)
        self.connect("motion-notify-event", self.on_motion_notify)
        self.connect("button-release-event", self.on_button_release)

        self.dragging = False
        self.drag_start_x = 0
        self.drag_start_y = 0

        self.show_all()

    def on_key_press(self, widget, event):
        if event.keyval == Gdk.KEY_q:
            Gtk.main_quit()

    def on_button_press(self, widget, event):
        if event.button == 1:  # 左键按下
            self.dragging = True
            self.drag_start_x = event.x
            self.drag_start_y = event.y

    def on_motion_notify(self, widget, event):
        if self.dragging and event.state & Gdk.ModifierType.BUTTON1_MASK:
            # 计算新的位置
            new_x = self.get_position()[0] + (event.x - self.drag_start_x)
            new_y = self.get_position()[1] + (event.y - self.drag_start_y)
            self.move(int(new_x), int(new_y))

    def on_button_release(self, widget, event):
        if event.button == 1:  # 左键释放
            self.dragging = False

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: showimg.py <image_path>")
        sys.exit(1)

    image_path = sys.argv[1]
    window = FullscreenImage(image_path)
    Gtk.main()
