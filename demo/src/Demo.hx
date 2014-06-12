package;

import lime.gl.GL;
import hxnanovg.Nvg;
import lime.Lime;

@:buildXml("&<include name='${haxelib:hx-nanovg}/Build.xml'/>")
class Demo {

    private var lime:Lime;
    var vg:cpp.Pointer<NvgContext>;

    public function new () {}

    public function ready (lime:Lime):Void {
        this.lime = lime;

        vg = Nvg.createGL(512, 512, 0);
        //Nvg.deleteGL(vg);
    }
    private function render ():Void {

        GL.viewport (0, 0, lime.config.width, lime.config.height);
        GL.clearColor (0.3, 0.3, 0.3, 1.0);
        GL.clear (GL.COLOR_BUFFER_BIT | GL.DEPTH_BUFFER_BIT | GL.STENCIL_BUFFER_BIT);

        Nvg.beginFrame(vg, 800, 600, 1.0, 0);
        Nvg.rect(vg, 100,100, 120,30);
        Nvg.circle(vg, 120,120, 5);
        Nvg.pathWinding(vg, cast(NvgSolidity.HOLE, Int));   // Mark circle as a hole.
        Nvg.fillColor(vg, Nvg.rgba(255,192,0,255));
        Nvg.fill(vg);
        Nvg.endFrame(vg);
    }
}