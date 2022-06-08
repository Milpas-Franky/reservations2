<?php

namespace App\Form;

use App\Entity\Users;
use App\Entity\Roles;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\CheckboxType;
use Symfony\Component\Form\Extension\Core\Type\PasswordType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Validator\Constraints\IsTrue;
use Symfony\Component\Validator\Constraints\Length;
use Symfony\Component\Validator\Constraints\NotBlank;
use Symfony\Component\Validator\Constraints\Blank;
use Symfony\Component\Validator\Constraints\Choice;
use Symfony\Component\Form\Extension\Core\Type\EmailType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\Extension\Core\Type\CollectionType;
use Symfony\Component\Form\FormEvent;
use Symfony\Component\Form\FormEvents;
use Symfony\Component\Form\Extension\DataCollector\Proxy\ResolvedTypeDataCollectorProxy;
use Symfony\Component\Form\ChoiceList\ChoiceList;
use Symfony\Component\Form\Extension\Core\Type\FormType;

class RegistrationFormType extends AbstractType
{
	/**
* BuildForm
*
* @param FormBuilderInterface $builder form builder
* @param array $options options
*
* @return void
*/
    public function buildForm(FormBuilderInterface $builder, array $options)
	{
     $builder
            ->add('email', EmailType::class)
			->add('firstname', TextType::class)
			->add('lastname', TextType::class)
			->add('langue', TextType::class)
			        
            ->add('username', TextType::class, [
                'constraints' => [
                    new Length([
                        'min' => 2,
                        'minMessage' => 'Votre nom d\'utilisateur doit contenir au moins {{ limit }} caractères.',
                    ]),
                ],
            ])
			->addEventListener(FormEvents::PRE_SUBMIT, function (FormEvent $event) use($options) {
            //recuperation de l'objet sur lequel le formulaire se base
			$example = $event->getData();
			
            //recuperation du formulaire
            //en fonction du type de l'utilisateur les champs sont différents
			
			$form = $event->getForm(); 
			
               
            })
            ->add('plainPassword', PasswordType::class, [
                // instead of being set onto the object directly,
                // this is read and encoded in the controller
                'mapped' => false,
                'constraints' => [
                    new NotBlank([
                        'message' => 'Veuillez saisir un mot de passe valide.',
                    ]),
                    new Length([
                        'min' => 6,
                        'minMessage' => 'Votre mot de passe doit contenir au moins {{ limit }} caractères.',
                        // max length allowed by Symfony for security reasons
                        'max' => 4096,
                    ]),
                ],
            ])
        ;
    }
    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            ['data_class' => Users::class],
			
        ]);
    }
}
