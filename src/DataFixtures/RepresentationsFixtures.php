<?php

namespace App\DataFixtures;

use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;
use Doctrine\Common\DataFixtures\DependentFixtureInterface;
use App\Entity\Representations;

class RepresentationsFixtures extends Fixture implements DependentFixtureInterface
{
    public function load(ObjectManager $manager): void
    {
        // $product = new Product();
        // $manager->persist($product);
                 $representations = [
            [
                'the_location'=>'espace-delvaux-la-venerie',
                'the_show'=>'ayiti',
                'schedule'=>'2012-10-12 13:30',
            ],
            [
                'the_location'=>'dexia-art-center',
                'the_show'=>'ayiti',
                'schedule'=>'2012-10-12 20:30',
            ],
            [
                'the_location'=>'dexia-art-center',
                'the_show'=>'cible-mouvante',
                'schedule'=>'2012-10-02 20:30',
            ],
            [
                'the_location'=>null,
                'the_show'=>'ceci-n-est-pas-un-chanteur-belge',
                'schedule'=>'2012-10-16 20:30',
            ],
			[
                'the_location'=>'la-samaritaine',
                'the_show'=>'Manneke… !',
                'schedule'=>' ',
            ],
        ];
        
        foreach ($representations as $record) {           
            $representation = new Representations();
            
            if($record['the_location']) {
                $representation->setTheLocation($this->getReference($record['the_location']));
            }
            
            $representation->setTheShow($this->getReference($record['the_show']));
            $representation->setSchedule(new \DateTime($record['schedule']));
                        
            $manager->persist($representation);
			$this->addReference(
                    $record['the_show']."-".$record['schedule'],
                    $representation
            );

        }

        $manager->flush();
    }
	public function getDependencies() {
        return [
            LocationsFixtures::class,
            ShowsFixtures::class,
        ];
    }

}
