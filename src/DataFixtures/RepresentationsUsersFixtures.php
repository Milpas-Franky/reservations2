<?php

namespace App\DataFixtures;

use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;
use Doctrine\Common\DataFixtures\DependentFixtureInterface;
use App\Entity\RepresentationsUsers;
use App\DataFixtures\RepresentationsFixtures;
use App\DataFixtures\UsersFixtures;

class RepresentationsUsersFixtures extends Fixture implements DependentFixtureInterface
{
    public function load(ObjectManager $manager): void
    {
        // $product = new Product();
        // $manager->persist($product);
$representationsusers = [
            [
                'user_firstname'=>'bob',
                'user_lastname'=>'Dylan',
                'titre'=>'ayiti',
				'date'=>'2012-10-12 13:30',
				'places'=>'2',
            ],
            [
                'user_firstname'=>'fred',
                'user_lastname'=>'Mercuri',
                'titre'=>'ayiti',
				'date'=>'2012-10-12 20:30',
				'places'=>'4',
            ],
            [
                'user_firstname'=>'stef',
                'user_lastname'=>'Kapond',
                'titre'=>'cible-mouvante',
				'date'=>'2012-10-02 20:30',
				'places'=>'6',
            ],
			[
                'user_firstname'=>'stef',
                'user_lastname'=>'Kapond',
                'titre'=>'ceci-n-est-pas-un-chanteur-belge',
				'date'=>'2012-10-16 20:30',
				'places'=>'8',
            ],
			
        ];
        
        foreach ($representationsusers as $record) {
					     $representationUser = new RepresentationsUsers();
						 //Assigner la référence du user correspondant
                        $representationUser->setUsers($this->getReference(
                        $record['user_firstname'].'-'.$record['user_lastname']));
                        //Assigner la référence de la représentation correspondante
                        $representationUser->setRepresentations($this->getReference($record['titre'].'-'.$record['date']));
                        $representationUser->setPlaces($record['places']);

                       //Persister l'entité principale
                        $manager->persist($representationUser);        
  				
                       }	

        $manager->flush();
    }
	    public function getDependencies() {
        return [
            UsersFixtures::class,
            RepresentationsFixtures::class,
        ];
    }

}
