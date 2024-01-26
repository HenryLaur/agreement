import { Component, OnInit } from '@angular/core';
import { SectorService } from '../service/sector.service';
import { AgreementService } from '../service/agreement.service';
import { ISector } from '../model/sector.model';
import { IAgreement } from '../model/agreement.model';
import { catchError, finalize, of } from 'rxjs';

interface SectorWithLevel extends ISector {
    level: number;
}

@Component({
    selector: 'app-agreement',
    templateUrl: './agreement.component.html',
})
export class AgreementComponent implements OnInit {
    sectors: SectorWithLevel[] = [];
    agreement: IAgreement = { name: null, sectors: null, isAgreed: false };
    loading = true;
    error = false;

    constructor(
        private sectorService: SectorService,
        private agreementService: AgreementService,
    ) {}

    ngOnInit(): void {
        this.sectorService.findAll().subscribe(response => {
            this.sectors = this.flattenSectors(response.body!);
            this.loading = false;
        });
    }

    save() {
        this.loading = true;
        (this.agreement.id ? this.agreementService.update(this.agreement) : this.agreementService.create(this.agreement))
            .pipe(
                finalize(() => (this.loading = false)),
                catchError(() => {
                    this.error = true;
                    return of();
                }),
            )
            .subscribe(response => {
                this.agreement = response.body!;
                this.error = false;
                this.loading = false;
            });
    }

    compareSectors(sector1?: ISector, sector2?: ISector) {
        return sector1?.id === sector2?.id;
    }

    private flattenSectors(sectors: ISector[], level: number = 1): SectorWithLevel[] {
        let flatSectors: SectorWithLevel[] = [];

        sectors.forEach(sector => {
            const flatSector: SectorWithLevel = {
                ...sector,
                level,
            };
            flatSectors.push(flatSector);
            if (sector.children?.length) {
                flatSectors = flatSectors.concat(this.flattenSectors(sector.children, level + 1));
            }
        });
        return flatSectors;
    }
}
