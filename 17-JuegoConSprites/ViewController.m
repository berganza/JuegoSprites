#import "ViewController.h"
@interface ViewController ()
@end
@implementation ViewController
@synthesize comienzoPantalla, miPuntuacion, pantallaDeJuego, miTiempo, puntuacion, puntosPerdidos, puntuacionMaquina;
- (void)viewDidLoad
{
    [super viewDidLoad];
	comienzoPantalla = NO;
    miTiempo = [NSTimer scheduledTimerWithTimeInterval:(1.0/1.0)
                                               target:self
                                             selector:@selector(comenzando)
                                             userInfo:nil
                                              repeats:YES];
    puntuacion=0;
    miPuntuacion.text=@"0";
    puntosPerdidos=0;
    puntuacionMaquina.text=@"0";
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint location = [touch locationInView:self.view];
    CGRect touchArea = CGRectMake(location.x, location.y, 50, 50);
    if (CGRectIntersectsRect(pantallaDeJuego.frame, touchArea)) {
        [pantallaDeJuego removeFromSuperview];
        puntuacion++;
        miPuntuacion.text = [NSString stringWithFormat:@"%d", puntuacion];
        //++++++++++++++++++++++++++++++++
        UIImageView *pacMan = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"comecocos.png"]];
        pacMan.frame = pantallaDeJuego.frame;
        [self.view addSubview:pacMan];
        [UIImageView animateWithDuration:0.5 animations:^{
            pacMan.alpha=0.0;
        } completion:^(BOOL finished) {
            [pacMan removeFromSuperview];
        }];
        //+++++++++++++++++++++++++++++++++
        CFBundleRef mainBundle = CFBundleGetMainBundle();
        CFURLRef soundFileURLRef;
        soundFileURLRef = CFBundleCopyResourceURL(mainBundle, (CFStringRef) @"disparoSideral", CFSTR ("wav"), NULL);
        UInt32 soundID;
        AudioServicesCreateSystemSoundID(soundFileURLRef, &soundID);
        AudioServicesPlaySystemSound (soundID);
    }
}
- (IBAction)starStop:(id)sender {
    if (comienzoPantalla==NO) {
        comienzoPantalla=YES;
    } else {
        comienzoPantalla=NO;
    }
}
-(void) comenzando {
    
    if ([pantallaDeJuego isDescendantOfView:self.view]) {
        [UIImageView animateWithDuration:0.5 animations:^{pantallaDeJuego.alpha=0.0;} completion:^(BOOL finished) {
            [pantallaDeJuego removeFromSuperview];
            puntosPerdidos++;
            puntuacionMaquina.text = [NSString stringWithFormat:@"%d",puntosPerdidos];
        }];
    }else{
        [self performSelector:@selector(inicializador)];
    }
}
-(void) inicializador {
    int x1=20;
    int x2=300;
    float myX = x1 + arc4random() % (x2 - x1);
    
    int y1=40;
    int y2=400;
    float myY = y1 + arc4random() % (y2 -y1);
    
    if (comienzoPantalla==YES) {
        pantallaDeJuego= [[UIImageView alloc] initWithFrame:CGRectMake(myX, myY, 50, 50)];
        [pantallaDeJuego setImage:[UIImage imageNamed:[NSString stringWithFormat:@"emo%d.png", (1+ arc4random()%12)]]];
        [self.view addSubview:pantallaDeJuego];
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end












