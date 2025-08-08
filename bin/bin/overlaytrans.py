#!/bin/python
import sys
import gi

gi.require_version('Gtk', '3.0')
gi.require_version('GtkLayerShell', '0.1')
from gi.repository import Gtk, Gdk, GtkLayerShell

class Window(Gtk.Window):
    def __init__(self):
        self.load_css()
        super().__init__()

        # 设置窗口为全屏
        #self.set_default_size(800, 600)
        self.fullscreen()

        # 使用 gtk-layer-shell
        GtkLayerShell.init_for_window(self)
        GtkLayerShell.set_layer(self, GtkLayerShell.Layer.OVERLAY)
        GtkLayerShell.set_keyboard_mode(self, GtkLayerShell.KeyboardMode.ON_DEMAND)

        GtkLayerShell.set_anchor(self, GtkLayerShell.Edge.TOP, True)
        GtkLayerShell.set_anchor(self, GtkLayerShell.Edge.BOTTOM, True)
        GtkLayerShell.set_anchor(self, GtkLayerShell.Edge.LEFT, True)
        GtkLayerShell.set_anchor(self, GtkLayerShell.Edge.RIGHT, True)
        GtkLayerShell.set_exclusive_zone(self, -1)
        GtkLayerShell.set_namespace(self, "overlaytrans")

        # 信号连接
        self.connect("key-release-event", self.handle_keyboard)
        self.dragging = False
        self.drag_start_x = 0
        self.drag_start_y = 0

        self.show_all()


    def handle_keyboard(self, w, event):
        if event.type == Gdk.EventType.KEY_RELEASE:
            if event.keyval == Gdk.KEY_Escape:
                Gtk.main_quit()

    def load_css(self):
        css_provider = Gtk.CssProvider()
        css_provider.load_from_data(b"""
            * {
                background-color: transparent;
                font-size: 24px;
            }
        """)

        Gtk.StyleContext.add_provider_for_screen(
            Gdk.Screen.get_default(),
            css_provider,
            Gtk.STYLE_PROVIDER_PRIORITY_USER)


if __name__ == "__main__":

    window = Window()
    Gtk.main()
